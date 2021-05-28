;;; Package --- Summary:
;;; Commentary:
;;; LSPサーバ設定
;;; Code:

;;;;; eglot ;;;;;
;; (use-package eglot
;;   :ensure t
;;   :config
;;   (add-to-list 'eglot-server-programs '(c++-mode . ("clangd")))
;;   (add-to-list 'eglot-server-programs '(rustic-mode . ("rust-analyzer")))
;;   (add-to-list 'eglot-server-programs '(python-mode . ("pyls")))
;;   (add-hook 'c++-mode-hook 'eglot-ensure)
;;   (add-hook 'rustic-mode-hook 'eglot-ensure)
;;   (add-hook 'python-mode-hook 'eglot-ensure)
;;   (define-key eglot-mode-map (kbd "C-c e f") 'eglot-format)
;;   (define-key eglot-mode-map (kbd "C-c e n") 'eglot-rename)
;;   )

(use-package ivy
  :diminish ivy-minor-mode
  )
(ivy-mode)
(use-package counsel)
(use-package swiper)
(use-package company)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
;;(global-set-key "\C-s" 'swiper)
