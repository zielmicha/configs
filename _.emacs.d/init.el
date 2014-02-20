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

;(set-face-attribute 'default nil :font "Inconsolata-14")

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                           ("marmalade" . "http://marmalade-repo.org/packages/")
                           ("melpa" . "http://melpa.milkbox.net/packages/")))

(add-to-list 'load-path "/home/michal/.emacs.d")
(add-to-list 'load-path "/home/michal/dotlang")

(load "util_func")

; favourite keybindings
(global-set-key "\C-l" 'goto-line)
(global-set-key [end] 'end-of-line)
(global-set-key [home] 'beginning-of-line)
(global-set-key "\C-o" 'other-window)
(global-set-key "\C-b" 'ido-switch-buffer)
(global-set-key [insert] nil)
;(global-set-key "\C-d" "\C-a\C- \C-n\M-w\C-y")
(global-set-key "\C-c\C-d" 'duplicate-line)

(require 'python)
(define-key python-mode-map (kbd "RET") 'newline-and-indent)

(add-to-list 'load-path "/home/michal/.emacs.d/nyan-mode")
(require 'nyan-mode)
(nyan-mode)

(require 'uniquify)
(setq
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":")

(add-to-list 'load-path "/home/michal/.emacs.d/ace-jump-mode")
(global-set-key (kbd "C-c c") 'ace-jump-word-mode)
(global-set-key (kbd "C-d") 'ace-jump-word-mode)
(global-set-key (kbd "C-c x") 'ace-jump-char-mode)
(global-set-key (kbd "C-c z") 'ace-jump-line-mode)

(add-to-list 'load-path "/home/michal/.emacs.d/markdown-mode")
(require 'markdown-mode)

(require 'flymake)
;(require 'flymake-cursor)

(require 'cython-mode)
(setq auto-mode-alist
      (append '(("\\.pyx$" . cython_mode)
                ) auto-mode-alist))

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

(require 'dotlang-mode)

;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))


(keyboard-translate ?( ?()
(keyboard-translate ?[ ?[)
(keyboard-translate ?) ?))
(keyboard-translate ?] ?])

(setq c-default-style "linux"
          c-basic-offset 4)

;(require 'pager)
;(global-set-key [next]     'pager-page-down)
;(global-set-key [prior]    'pager-page-up)

(add-to-list 'load-path "~/.emacs.d/auto-complete/lib/popup")
(add-to-list 'load-path "~/.emacs.d/auto-complete/lib/fuzzy")
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(add-to-list 'load-path "~/.emacs.d/nimrod-mode")
(require 'nimrod-mode)

;(add-to-list 'load-path "~/.emacs.d/pymacs")
;(add-to-list 'load-path "~/.emacs.d/ropemacs")

;(autoload 'pymacs-apply "pymacs")
;(autoload 'pymacs-call "pymacs")
;(autoload 'pymacs-eval "pymacs" nil t)
;(autoload 'pymacs-exec "pymacs" nil t)
;(autoload 'pymacs-load "pymacs" nil t)
;(autoload 'pymacs-autoload "pymacs")

;(require 'pymacs)
;(pymacs-load "ropemacs" "rope-")
;(setq ropemacs-enable-autoimport t)
;(setq ropemacs-enable-shortcuts nil)

(add-to-list 'load-path "~/.emacs.d/paredit")
(require 'paredit)
(add-hook 'paredit-mode-hook (lambda ()
                               (define-key paredit-mode-map (kbd "C-<left>") 'left-word)
                               (define-key paredit-mode-map (kbd "C-<right>") 'right-word)
                               (message "Whooo!")))

(setq load-path (cons (concat "/usr/share/emacs/site-lisp/erlang") load-path))
(setq erlang-root-dir "/usr/lib/erlang")
(setq exec-path (cons "/usr/lib/erlang/bin" exec-path))
(require 'erlang-start)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (manoj-dark)))
 '(help-at-pt-display-when-idle (quote (flymake-overlay)) nil (help-at-pt))
 '(help-at-pt-timer-delay 0.5))
