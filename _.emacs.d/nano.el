(show-paren-mode 1)
; copyied from korrisite.com
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq comint-prompt-read-only t)
(setq-default indicate-empty-lines t)
(setq require-final-newline 't)
(ido-mode 1)
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
