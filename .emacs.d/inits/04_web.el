;;; Package --- web specific
;;; Commentary:
;;; Code:

(use-package web-mode
             :mode (("\\.phtml$"     . web-mode)
                    ("\\.tpl\\.php$" . web-mode)
                    ("\\.ctp$"       . web-mode)
                    ("\\.jsp$"       . web-mode)
                    ("\\.as[cp]x$"   . web-mode)
                    ("\\.slim$"      . web-mode)
                    ("\\.erb$"       . web-mode)
                    ("\\.html?$"     . web-mode))
             :config (
                      )
             )

(use-package pug-mode
             :mode (("\\.pug$"     . pug-mode)))

;; ;;; 適用する拡張子
(add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.ctp$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))

;;; インデント数 ;; -> editorconfigに任せる
;;(defun web-mode-hook ()
;; "Hooks for Web mode."
;;;; (setq web-mode-markup-indent-offset   2)
;;)

(eval-after-load 'web-mode
                 '(add-hook 'web-mode-hook #'add-node-modules-path))

(defun my/prettier ()
  (interactive)
  (shell-command
    (format "%s --write %s"
            (shell-quote-argument (executable-find "prettier"))
            (shell-quote-argument (expand-file-name buffer-file-name))))
  (revert-buffer t t t))

;; 保存時に自動実行
;(add-hook 'web-mode-hook
; (lambda ()
;   (add-hook 'after-save-hook 'my/prettier t t)))

(add-hook 'web-mode-hook 'web-mode-hook)
;(setq web-mode-disable-auto-pairing nil)

(use-package twig-mode)
