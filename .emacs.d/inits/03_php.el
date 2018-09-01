;; php-mode
(use-package php-mode)

(add-to-list 'auto-mode-alist '("\\.php$"     . php-mode))

;; php-mode タブ設定とか
(setq php-mode-force-pear t)
(add-hook 'php-mode-user-hook
         '(lambda ()
            (c-set-style "stroustrup")
            (c-set-offset 'comment-intro 0)
            (setq tab-width 4)
            (setq c-basic-offset 4)
            (setq indent-tabs-mode nil)
))

