;;; Package-- - summary
;;; Commentary:
;;; Code:

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'use-package)

(package-initialize)
(custom-set-variables
 '(init-loader-show-log-after-init 'error-only))
(init-loader-load)
(provide 'init)
;;; init.el ends here
