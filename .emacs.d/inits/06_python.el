;;; Package --- summary
;;; Commentary:
;;; Code:

(use-package py-autopep8)
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
(global-auto-revert-mode 1)

;;; 06_python.el ends here
