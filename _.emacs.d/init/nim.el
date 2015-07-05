(add-to-list 'load-path "~/.emacs.d/nimrod-mode")

(require 'nim-mode)
(require 'company-nim)
(add-to-list 'company-backends 'company-nim)
(add-hook 'nim-mode-hook 'company-mode)

(setq nim-nimsuggest-path "~/.nimble/bin/nimsuggest")
