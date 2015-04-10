(setq auto-mode-alist
      (append '(("\\.pyx$" . cython_mode)
                ) auto-mode-alist))

(setq auto-mode-alist
	  (append
	   '(("CMakeLists\\.txt\\'" . cmake-mode))
	   '(("\\.cmake\\'" . cmake-mode))
	   auto-mode-alist))

(setq auto-mode-alist
      (append '(("\\.dart$" . dart-mode)
                ) auto-mode-alist))
