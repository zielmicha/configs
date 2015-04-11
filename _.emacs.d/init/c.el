
(defadvice c-lineup-arglist (around my activate)
  "Improve indentation of continued C++11 lambda function opened as argument."
  (setq ad-return-value
        (if (and (equal major-mode 'c++-mode)
                 (ignore-errors
                   (save-excursion
                     (goto-char (c-langelem-pos langelem))
                     ;; Detect "[...](" or "[...]{". preceded by "," or "(",
                     ;;   and with unclosed brace.
                     (looking-at ".*[(,][ \t]*\\[[^]]*\\][ \t]*[({][^}]*$"))))
            0                           ; no additional indent
          ad-do-it)))                   ; default behavior

; jump between header and cpp
(add-hook 'c-mode-common-hook
  (lambda()
    (local-set-key  (kbd "C-c o") 'ff-find-other-file)))

(setq c-default-style "linux"
      c-basic-offset 4)

;;; ycm

(add-to-list 'load-path "~/.emacs.d/emacs-ycmd")
(require 'ycmd)
(ycmd-setup)
(set-variable 'ycmd-server-command '("python" "/home/michal/.emacs.d/ycmd/ycmd"))

(require 'company-ycmd)
(company-ycmd-setup)

(require 'flycheck-ycmd)
(flycheck-ycmd-setup)

(add-hook 'c++-mode-hook (lambda () (flycheck-mode)))

(add-hook 'python-mode-hook (lambda () (add-to-list 'flycheck-disabled-checkers 'ycmd)))

(set-variable 'ycmd-extra-conf-whitelist '("~/husarion/robocore-*"
                                           "~/multilink"))

(setq ycmd-goto-lambda (lambda () (local-set-key (kbd "M-.") 'ycmd-goto)))
(add-hook 'c++-mode-hook ycmd-goto-lambda)
(add-hook 'c-mode-hook ycmd-goto-lambda)
