;;; Package --- js specific
;;; Commentary:
;;; Code:

(use-package js2-mode)
(add-to-list 'auto-mode-alist (cons  "\\.\\(qml\\|js\\|as\\|json\\|jsn\\)\\'" 'js2-mode))
(setq js-indent-level 2)
;;; ends here
