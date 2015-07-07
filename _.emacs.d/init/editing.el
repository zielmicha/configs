
(setq show-trailing-whitespace t)
(show-paren-mode 1)
(setq require-final-newline 't)
(setq-default indicate-empty-lines t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(delete-selection-mode 1)


(add-to-list 'load-path "~/.emacs.d/ace-jump-mode")
(require 'ace-jump-mode)

(add-to-list 'load-path "~/.emacs.d/multiple-cursors.el")
(require 'multiple-cursors)

(add-to-list 'load-path "~/.emacs.d/paredit")
(require 'paredit)
(add-hook 'paredit-mode-hook (lambda ()
                               (define-key paredit-mode-map (kbd "C-<left>") 'left-word)
                               (define-key paredit-mode-map (kbd "C-<right>") 'right-word)
                               (message "Whooo!")))

(add-to-list 'load-path "~/.emacs.d/auto-complete/lib/popup")
(add-to-list 'load-path "~/.emacs.d/auto-complete/lib/fuzzy")
(add-to-list 'load-path "~/.emacs.d/auto-complete")

(add-to-list 'load-path "~/.emacs.d/company-mode")
(add-hook 'after-init-hook 'global-company-mode)

(add-to-list 'load-path "~/.emacs.d/flycheck")
(require 'let-alist)
(require 'flycheck)
(add-hook 'after-init-hook 'global-flycheck-mode)
(setq flycheck-highlighting-mode 'lines)

;(require 'pager)
;(global-set-key [next]     'pager-page-down)
;(global-set-key [prior]    'pager-page-up)


(add-to-list 'load-path "~/.emacs.d/nyan-mode")
(require 'nyan-mode)
(nyan-mode)

;(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-to-list 'load-path "~/.emacs.d/ws-butler")
(require 'ws-butler)
(ws-butler-global-mode)
