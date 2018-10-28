;;; Package --- js specific
;;; Commentary:
;;; Code:

(use-package js2-mode)
(add-to-list 'auto-mode-alist (cons  "\\.js\\'" 'js2-mode))
(setq js-indent-level 2)


;; rjsx-mode
;;(add-to-list 'auto-mode-alist '("\\.js$"     . rjsx-mode))

(add-hook 'rjsx-mode-hook
          (lambda ()
            (setq js-indent-level 2) ;;スペースは２つ、デフォルトは4
            (setq js2-strict-missing-semi-warning nil))) ;;行末のセミコロンの警告はオフ

(add-hook 'JSON-mode-hook 'hs-minor-mode)
(add-hook 'json-mode-hook 'hs-minor-mode)


(use-package prettier-js)
(add-hook 'js2-mode-hook 'prettier-js-mode)

(add-hook 'js2-mode-hook
          (lambda ()
            (add-hook 'after-save-hook 'prettier-js t t)
            (setq js2-strict-missing-semi-warning nil)
            (setq js2-mode-show-parse-errors nil)
            (setq js2-mode-show-strict-warnings nil)
            ))

(eval-after-load 'js2-mode
  '(add-hook 'js2-mode-hook #'add-node-modules-path))

(setq prettier-js-args '(
                         "--bracket-spacing" "false"
                         "--tab-width" "2"
                         "--no-semi"
                         ))

;;; ends here
