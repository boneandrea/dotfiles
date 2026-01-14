;;; Package --- init.el
;;; Commentary:
;;; Code:

;; use-packageがインストールされていなかったらuse-packageをインストール
(dolist (package '(use-package))
  (unless (package-installed-p package)
    (package-install package)))

;;; straight
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

                                        ;(org-elpa melpa gnu-elpa-mirror el-get emacsmirror-mirror) with
(straight-pull-recipe-repositories)
(setq straight-use-package-by-default t)
;;(org-elpa melpa gnu-elpa-mirror el-get emacsmirror-myesirror) with ‘straight-pull-recipe-repositories’ may fix this
;; add melpa(http://)

(use-package init-loader)

;;; ログはエラーが出た時のみ
(custom-set-variables
 '(init-loader-show-log-after-init 'error-only))

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/") t)
;; (when (require 'package nil t)
;;   (add-to-list 'package-archives
;;                '("melpa-stable" . "https://stable.melpa.org/packages/"))
;;   (package-initialize))
(package-initialize)


;; Emacs27で"Package cl is deprecated"を抑制する方法
;; https://tam5917.hatenablog.com/entry/2021/03/30/180301
(setq byte-compile-warnings '(cl-functions))

;; (use-package treesit-auto
;;   :ensure t
;;   :config
;;   (setq treesit-auto-install t)
;;   (global-treesit-auto-mode))

;; (use-package treesit-auto
;;   :config
;;     (setq treesit-font-lock-level 4))


(put 'upcase-region 'disabled nil)
(init-loader-load "~/.emacs.d/inits")

;;; init.el ends
