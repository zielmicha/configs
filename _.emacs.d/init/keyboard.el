
(global-set-key "\C-l" 'goto-line)
(global-set-key [end] 'end-of-line)
(global-set-key [home] 'beginning-of-line)
(global-set-key "\C-o" 'other-window)
(global-set-key "\C-b" 'ido-switch-buffer)
(global-set-key [insert] nil)
;(global-set-key "\C-d" "\C-a\C- \C-n\M-w\C-y")
(global-set-key "\C-c\C-d" 'duplicate-line)

(keyboard-translate ?( ?()
(keyboard-translate ?[ ?[)
(keyboard-translate ?) ?))
(keyboard-translate ?] ?])

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
