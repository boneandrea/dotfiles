;;; Package-- - summary
;;; Commentary:
;;; Code:

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(package-initialize)
(require 'use-package)


(custom-set-variables
 '(init-loader-show-log-after-init 'error-only))
(init-loader-load)
(provide 'init)
;;; init.el ends here
