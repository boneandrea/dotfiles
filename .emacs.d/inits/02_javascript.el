;;; Package --- js specific
;;; Commentary:
;;; Code:

;; (use-package js2-mode)
;; (add-to-list 'auto-mode-alist (cons  "\\.js\\'" 'js2-mode))
;; (setq js-indent-level 4)


;; ;; rjsx-mode
;; ;;(add-to-list 'auto-mode-alist '("\\.js$"     . rjsx-mode))

;; (add-hook 'rjsx-mode-hook
;;           (lambda ()
;;             (setq js-indent-level 2) ;;スペースは２つ、デフォルトは4
;;             (setq js2-strict-missing-semi-warning nil))) ;;行末のセミコロンの警告はオフ

;; (add-hook 'JSON-mode-hook 'hs-minor-mode)
;; (add-hook 'json-mode-hook 'hs-minor-mode)

;; ;;
;; (use-package prettier-js)

;; (eval-after-load 'js2-mode
;;     '(progn
;;            (add-hook 'js2-mode-hook #'add-node-modules-path)
;;            (add-hook 'js2-mode-hook #'prettier-js-mode)))

;; (add-hook 'js2-mode-hook 'prettier-js-mode)
;; (add-hook 'js2-mode-hook
;;           (lambda ()
;;             (add-hook 'after-save-hook 'prettier-js t t)
;;             (setq js2-strict-missing-semi-warning nil)
;;             (setq js2-mode-show-parse-errors nil)
;;             (setq js2-mode-show-strict-warnings nil)
;;             ))

;; (setq prettier-js-command "ssh")
;; (setq prettier-js-args '( "pi.local" "prettier"))

(use-package vue-mode)
(use-package add-node-modules-path)
(use-package typescript-mode)

(add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))

(add-hook 'vue-mode-hook 'flycheck-mode)
(eval-after-load 'vue-mode
  '(add-hook 'vue-mode-hook #'add-node-modules-path))
(flycheck-add-mode 'javascript-eslint 'vue-mode)
(flycheck-add-mode 'javascript-eslint 'vue-html-mode)
(flycheck-add-mode 'javascript-eslint 'css-mode)
(add-hook 'javascript-mode-hook #'prettier-js-mode)

;;; ends here
