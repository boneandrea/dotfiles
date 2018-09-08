;;; Package --- js specific
;;; Commentary:
;;; Code:

(use-package js2-mode)
(add-to-list 'auto-mode-alist (cons  "\\.\\(qml\\|js\\|as\\|json\\|jsn\\)\\'" 'js2-mode))
(setq js-indent-level 2)

;; rjsx-mode
;;(add-to-list 'auto-mode-alist '("\\.js$"     . rjsx-mode))

(add-hook 'rjsx-mode-hook
          (lambda ()
            (setq js-indent-level 2) ;;スペースは２つ、デフォルトは4
            (setq js2-strict-missing-semi-warning nil))) ;;行末のセミコロンの警告はオフ


;;; ends here
