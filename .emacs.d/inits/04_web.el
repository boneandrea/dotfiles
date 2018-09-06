;;; Package --- web specific
;;; Commentary:
;;; Code:

(use-package web-mode
  :mode (("\\.phtml$"     . web-mode)
         ("\\.ctp$"       . web-mode)
         ("\\.tpl\\.php$" . web-mode)
         ("\\.jsp$"       . web-mode)
         ("\\.as[cp]x$"   . web-mode)
         ("\\.slim\\vue$"       . web-mode)
         ("\\.erb$"       . web-mode)
         ("\\.html?$"     . web-mode))
  :config (
           )
  )

(use-package pug-mode
  :mode (("\\.pug$"     . pug-mode)))

;; ;;; 適用する拡張子
;; (add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.ctp$"       . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))

;;; インデント数
(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-html-offset   2)
  (setq web-mode-css-offset    2)
  (setq web-mode-script-offset 2)
  (setq web-mode-php-offset    2)
  (setq web-mode-java-offset   2)
  (setq web-mode-asp-offset    2))
(add-hook 'web-mode-hook 'web-mode-hook)
;(setq web-mode-disable-auto-pairing nil)

;; rjsx-mode タブ設定
(add-to-list 'auto-mode-alist '("\\.js$"     . rjsx-mode))

(add-hook 'rjsx-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil) ;;インデントはタブではなくスペース
            (setq js-indent-level 2) ;;スペースは２つ、デフォルトは4
            (setq js2-strict-missing-semi-warning nil))) ;;行末のセミコロンの警告はオフ

