(require 'python)
(define-key python-mode-map (kbd "RET") 'newline-and-indent)

(require 'python-auto-import)
(global-set-key (kbd "C-c a") 'python-auto-import)

(add-to-list 'load-path "~/.emacs.d/elpy")
(add-to-list 'load-path "~/.emacs.d/yasnippet")
(add-to-list 'load-path "~/.emacs.d/pymacs")
(require 'elpy)

(setq elpy-modules
      '(elpy-module-sane-defaults
        elpy-module-company
        elpy-module-eldoc
        elpy-module-pyvenv))

(elpy-use-ipython)
(setq elpy-rpc-backend "jedi")
(elpy-enable)
(ac-set-trigger-key "RET")

(setq flycheck-flake8rc "/home/michal/.emacs.d/flake8rc.conf")

(setq flycheck-disabled-checkers '(emacs-lisp-checkdoc emacs-lisp))
