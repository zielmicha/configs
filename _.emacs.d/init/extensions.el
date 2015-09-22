(setq auto-mode-alist
      (append
       '(("\\.pyx$" . cython_mode))
	   '(("CMakeLists\\.txt\\'" . cmake-mode))
	   '(("\\.cmake\\'" . cmake-mode))
       '(("\\.dart$" . dart-mode))
       '(("\\.h$" . c++-mode))
       '(("\\.md$" . markdown-mode))
       '(("\\.ts\\'" . typescript-mode))
       '(("\\.nimble\\'" . conf-mode))
       '(("\\.conf\\'" . nginx-mode))
       '(("/etc/nginx/" . nginx-mode))
       '(("\\.lua$" . lua-mode))
       auto-mode-alist))

(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
