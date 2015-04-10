(show-paren-mode 1)
; copyied from korrisite.com
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq comint-prompt-read-only t)
(setq-default indicate-empty-lines t)
(setq require-final-newline 't)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(delete-selection-mode 1)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(setq show-trailing-whitespace t)
(fset 'yes-or-no-p 'y-or-n-p)

(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)

(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

(set-face-attribute 'default nil :height 100)

;(set-face-attribute 'default nil :font "Inconsolata-14")

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                           ("marmalade" . "http://marmalade-repo.org/packages/")
                           ("melpa" . "http://melpa.milkbox.net/packages/")))

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/dotlang")

(require 'python)
(define-key python-mode-map (kbd "RET") 'newline-and-indent)

(add-to-list 'load-path "/home/michal/.emacs.d/nyan-mode")
(require 'nyan-mode)
(nyan-mode)

(require 'flymake)
;(require 'flymake-cursor)

(defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "pyflakes" (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init))
;(add-hook 'find-file-hook 'flymake-find-file-hook)

;(require 'dotlang-mode)

(setq c-default-style "linux"
          c-basic-offset 4)

;(require 'pager)
;(global-set-key [next]     'pager-page-down)
;(global-set-key [prior]    'pager-page-up)

(add-to-list 'load-path "~/.emacs.d/auto-complete/lib/popup")
(add-to-list 'load-path "~/.emacs.d/auto-complete/lib/fuzzy")
(add-to-list 'load-path "~/.emacs.d/auto-complete")

; jump between header and cpp
(add-hook 'c-mode-common-hook
  (lambda()
    (local-set-key  (kbd "C-c o") 'ff-find-other-file)))

(add-to-list 'load-path "~/.emacs.d/paredit")
(require 'paredit)
(add-hook 'paredit-mode-hook (lambda ()
                               (define-key paredit-mode-map (kbd "C-<left>") 'left-word)
                               (define-key paredit-mode-map (kbd "C-<right>") 'right-word)
                               (message "Whooo!")))


(add-to-list 'load-path "~/.emacs.d/helm")
(require 'helm-config)

(global-set-key (kbd "C-c h") 'helm-mini)

(add-to-list 'load-path "~/.emacs.d/helm-git-grep")

(require 'helm-git-grep)
(global-set-key (kbd "C-c g") 'helm-git-grep)
;; Invoke `helm-git-grep' from isearch.
(define-key isearch-mode-map (kbd "C-c g") 'helm-git-grep-from-isearch)
;; Invoke `helm-git-grep' from other helm.
(eval-after-load 'helm
  '(define-key helm-map (kbd "C-c g") 'helm-git-grep-from-helm))

;(global-set-key (kbd "C-x C-f") 'helm-find-files)
;(global-set-key (kbd "C-c b") 'helm-buffers-list)

(add-to-list 'load-path "~/.emacs.d/flx")
(require 'flx)
(require 'flx-ido)

(add-to-list 'load-path "~/.emacs.d/dash.el")
(add-to-list 'load-path "~/.emacs.d/projectile")
(require 'projectile)
(projectile-global-mode)
(global-set-key (kbd "C-x p") 'projectile-find-file)
(setq projectile-enable-caching t)

(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)

(add-to-list 'custom-theme-load-path "~/.emacs.d/solarized")
(add-to-list 'load-path "~/.emacs.d/solarized")

(require 'scad)

(add-to-list 'load-path "~/.emacs.d/elpy")
(add-to-list 'load-path "~/.emacs.d/company-mode")
(add-to-list 'load-path "~/.emacs.d/yasnippet")
(add-to-list 'load-path "~/.emacs.d/pymacs")
(require 'elpy)
(setq elpy-default-minor-modes
      ;(delete
      ; 'auto-complete-mode
       (delete 'highlight-indentation-mode
               (delete
                'yas-minor-mode
                elpy-default-minor-modes)))
(elpy-use-ipython)
(setq elpy-rpc-backend "jedi")
(elpy-enable)
(ac-set-trigger-key "RET")

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


(add-to-list 'load-path "~/.emacs.d/multi-web-mode")
(require 'multi-web-mode)
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
                  (js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
                  (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
(multi-web-global-mode 1)

(add-to-list 'load-path "~/.emacs.d/multiple-cursors.el")
(require 'multiple-cursors)

(add-to-list 'load-path "~/.emacs.d/s.el")

;(require 'color-theme)
;(setq color-theme-is-global t)
;(eval-after-load "color-theme" '(color-theme-hober))

;(require 'doremi-cmd)

;(set-default-font "-unknown-Input Serif-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1")
;(set-default-font "-unknown-Input Serif Condensed-light-normal-condensed-*-*-*-*-*-*-0-iso10646-1")

(require 'python-auto-import)
(global-set-key (kbd "C-c a") 'python-auto-import)

(load "~/.emacs.d/init/navigation")
(load "~/.emacs.d/init/util_func")
(load "~/.emacs.d/init/modes")
(load "~/.emacs.d/init/keyboard")
(load "~/.emacs.d/init/extensions")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(custom-safe-themes (quote ("e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(help-at-pt-display-when-idle (quote (flymake-overlay)) nil (help-at-pt))
 '(help-at-pt-timer-delay 0.5)
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
