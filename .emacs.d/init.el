;;; Package-- - summary
;;; Commentary:
;;; Code:

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(package-initialize)

;; init-loader, use-packageのインストール(caskで入らない)
(require 'package)
(add-to-list 'package-archives '("melpa"."http://melpa.org/packages/"))
(package-initialize)
(unless package-archive-contents (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; init-loader, use-packageのインストール(caskで入らない)
(unless (package-installed-p 'init-loader)
  (package-install 'init-loader))


;; (unless (package-installed-p 'use-package)
;;   (package-install 'use-package))



(add-to-list 'load-path "~/.emacs.d/local-lisp")

(custom-set-variables
 '(init-loader-show-log-after-init 'error-only))
(init-loader-load)
(provide 'init)
;;; init.el ends here
(put 'set-goal-column 'disabled nil)
