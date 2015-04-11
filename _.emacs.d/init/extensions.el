(setq auto-mode-alist
      (append
       '(("\\.pyx$" . cython_mode))
	   '(("CMakeLists\\.txt\\'" . cmake-mode))
	   '(("\\.cmake\\'" . cmake-mode))
       '(("\\.dart$" . dart-mode))
       '(("\\.h$" . c++-mode))
       auto-mode-alist))
