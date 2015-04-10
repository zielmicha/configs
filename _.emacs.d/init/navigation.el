(ido-mode 1)

(require 'uniquify)
(setq
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":")

(add-to-list 'load-path "/home/michal/.emacs.d/ace-jump-mode")
(require 'ace-jump-mode)
(global-set-key (kbd "C-c c") 'ace-jump-word-mode)
(global-set-key (kbd "C-d") 'ace-jump-word-mode)
(global-set-key (kbd "C-c x") 'ace-jump-char-mode)
(global-set-key (kbd "C-c z") 'ace-jump-line-mode)
(global-set-key (kbd "C-c l") 'ace-jump-line-mode)
