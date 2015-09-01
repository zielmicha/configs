(add-to-list 'load-path "~/.emacs.d/markdown-mode")
(require 'markdown-mode)

(require 'protobuf-mode)

(require 'haxe-mode)

(require 'cython-mode)

(add-to-list 'load-path "~/.emacs.d/dockerfile-mode")
(require 'dockerfile-mode)

(add-to-list 'load-path "~/.emacs.d/nginx-mode")
(require 'nginx-mode)
(add-to-list 'auto-mode-alist '("/etc/nginx/" . nginx-mode))

(add-to-list 'load-path "~/.emacs.d/emacs-gradle-mode")
(require 'gradle-mode)

(add-to-list 'load-path "~/.emacs.d/groovy-emacs-modes")
(require 'groovy-mode)

(add-to-list 'load-path "~/.emacs.d/yaml-mode")
(require 'yaml-mode)

(add-to-list 'load-path "~/.emacs.d/dart-mode")
(require 'dart-mode)

(require 'cmake-mode)

(add-to-list 'auto-mode-alist '("\\.mm\\'" . objc-mode))

;(setq load-path (cons (concat "/usr/share/emacs/site-lisp/erlang") load-path))
;(setq erlang-root-dir "/usr/lib/erlang")
;(setq exec-path (cons "/usr/lib/erlang/bin" exec-path))
;(require 'erlang-start)

(add-to-list 'load-path "~/.emacs.d/multi-web-mode")
(require 'multi-web-mode)
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
                  (js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
                  (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
(multi-web-global-mode 1)

(require 'scad)

(add-to-list 'load-path "~/dotlang")
;(require 'dotlang-mode)
