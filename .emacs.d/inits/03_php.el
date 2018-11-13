;;; Package --- specific
;;; Commentary:
;;; Code:

(use-package cl)
(use-package php-mode)

(add-to-list 'auto-mode-alist '("\\.php$"     . php-mode))

;; php-mode タブ設定とか
(setq php-mode-force-pear t)


(add-hook 'php-mode-hook
          '(lambda ()

             (c-set-style "stroustrup")
             (c-set-offset 'comment-intro 0)
             (setq tab-width 4)
             (setq c-basic-offset 4)
             (setq indent-tabs-mode nil)

             ;; ac-modeの設定
             (auto-complete-mode t)
             (require 'ac-php)
             (setq ac-sources  '(ac-source-php ) )
             (yas-global-mode 1)
             (ac-php-core-eldoc-setup ) ;; enable eldoc

             (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
             (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back)    ;go back
             ))
;;; ends here
