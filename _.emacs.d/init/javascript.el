
(add-to-list 'load-path "~/.emacs.d/json-reformat")
(add-to-list 'load-path "~/.emacs.d/json-snatcher")
(add-to-list 'load-path "~/.emacs.d/json-mode")
(add-to-list 'load-path "~/.emacs.d/yaxception")
(add-to-list 'load-path "~/.emacs.d/log4e")
(add-to-list 'load-path "~/.emacs.d/emacs-tss")

(require 'typescript)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))

(require 'tss)

(setq tss-popup-help-key "C-:")
(setq tss-jump-to-definition-key "C->")
(setq tss-implement-definition-key "C-c i")


;(add-to-list 'load-path "~/.emacs.d/flymake-jslint")
;(require 'flymake-jslint)
;(add-hook 'js-mode-hook 'flymake-jslint-load)
