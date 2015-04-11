(ido-mode 1)

(require 'uniquify)
(setq
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":")

(add-to-list 'load-path "~/.emacs.d/flx")
(require 'flx)
(require 'flx-ido)

(add-to-list 'load-path "~/.emacs.d/projectile")
(require 'projectile)
(projectile-global-mode)
(global-set-key (kbd "C-x p") 'projectile-find-file)
(setq projectile-enable-caching t)

(add-to-list 'load-path "~/.emacs.d/helm")
(require 'helm-config)

(global-set-key (kbd "C-c h") 'helm-mini)

(add-to-list 'load-path "~/.emacs.d/helm-git-grep")

(require 'helm-git-grep)
(global-set-key (kbd "C-c g") 'helm-git-grep)
;; Invoke `helm-git-grep' from isearch.
(define-key isearch-mode-map (kbd "C-c g") 'helm-git-grep-from-isearch)
;; Invoke `helm-git-grep' from other helm.
(eval-after-load 'helm
  '(define-key helm-map (kbd "C-c g") 'helm-git-grep-from-helm))
