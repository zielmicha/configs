(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/s.el")

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                           ("marmalade" . "http://marmalade-repo.org/packages/")
                           ("melpa" . "http://melpa.milkbox.net/packages/")))

(set-face-attribute 'default nil :height 100)


(setq comint-prompt-read-only t)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(fset 'yes-or-no-p 'y-or-n-p)

(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)

(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)
