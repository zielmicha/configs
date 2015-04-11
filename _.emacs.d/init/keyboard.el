
(global-set-key "\C-l" 'goto-line)
(global-set-key [end] 'end-of-line)
(global-set-key [home] 'beginning-of-line)
(global-set-key "\C-o" 'other-window)
(global-set-key "\C-b" 'ido-switch-buffer)
(global-set-key [insert] nil)
(global-set-key "\C-c\C-d" 'duplicate-line)

(keyboard-translate ?( ?()
(keyboard-translate ?[ ?[)
(keyboard-translate ?) ?))
(keyboard-translate ?] ?])

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(global-set-key (kbd "C-c c") 'ace-jump-word-mode)
(global-set-key (kbd "C-d") 'ace-jump-word-mode)
(global-set-key (kbd "C-c x") 'ace-jump-char-mode)
(global-set-key (kbd "C-c z") 'ace-jump-line-mode)
(global-set-key (kbd "C-c l") 'ace-jump-line-mode)

(global-set-key (kbd "C-/") 'company-complete)
