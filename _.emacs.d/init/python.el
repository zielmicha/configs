(require 'python)
(define-key python-mode-map (kbd "RET") 'newline-and-indent)

(require 'python-auto-import)
(global-set-key (kbd "C-c a") 'python-auto-import)

(add-to-list 'load-path "~/.emacs.d/elpy")
(add-to-list 'load-path "~/.emacs.d/company-mode")
(add-to-list 'load-path "~/.emacs.d/yasnippet")
(add-to-list 'load-path "~/.emacs.d/pymacs")
(require 'elpy)

(setq elpy-modules
      '(elpy-module-sane-defaults
        elpy-module-company
        elpy-module-eldoc
        elpy-module-flymake
        elpy-module-pyvenv))

(elpy-use-ipython)
(setq elpy-rpc-backend "jedi")
(elpy-enable)
(ac-set-trigger-key "RET")

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


(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
