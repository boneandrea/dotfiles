;; .emacs

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'package)
;; MELPA, Marmaladeを追加
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/"))

;; 初期化
(package-initialize)
(require 'use-package)


;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;; melpaのmewが動かないのでgitで持ってくる
(setq load-path (cons "~/lib/emacs/mew" load-path))
(setq exec-path (cons "~/lib/emacs/mew/bin" exec-path))

;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" system-name))


(set-language-environment 'Japanese)
(set-terminal-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(setq coding-system-for-read 'mule-utf-8-unix)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8-unix)


;; % でmatch

 (global-set-key "%" 'match-paren)
 (defun match-paren (arg)
   "Go to the matching parenthesis if on parenthesis otherwise insert %."
   (interactive "p")
   (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
         ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
         (t (self-insert-command (or arg 1)))))

;;



(setq display-time-24hr-format t)
(setq display-time-string-forms

'((if display-time-day-and-date
	  (format "%s/%s/%s " year month day)
	"")
  (format "%s:%s%s"
		  (if display-time-24hr-format 24-hours 12-hours)
		  minutes
		  (if display-time-24hr-format "" am-pm))))

(display-time)
(setq visible-bell t)

;; no need backup file

(setq make-backup-files nil)

;;

(global-set-key "\C-h" 'delete-backward-char)

(define-key ctl-x-map "6" 'goto-line)
(define-key ctl-x-map "7" 'calendar)
(define-key ctl-x-map "8" 'mew)
(define-key ctl-x-map "0" 'global-whitespace-mode)
(define-key ctl-x-map "4" 'magit-status)
(define-key ctl-x-map ";" 'compile)

(define-key ctl-x-map ":" 'comment-region)
(define-key ctl-x-map ")" 'revert-buffer)


;; php-mode
(use-package "php-mode")

;; php-mode タブ設定とか
(setq php-mode-force-pear t)
(add-hook 'php-mode-user-hook
         '(lambda ()
            (c-set-style "stroustrup")
            (c-set-offset 'comment-intro 0)
            (setq tab-width 4)
            (setq c-basic-offset 4)
            (setq indent-tabs-mode nil)
))


;; flymake (Emacs22から標準添付されている)
(use-package flymake)



;;; A sample file of .emacs or a site configuration file

(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)


;; ruby-mode

(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                                     interpreter-mode-alist))


;; javascript-mode                                                                                                                                                     

(add-to-list 'auto-mode-alist (cons  "\\.\\(qml\\|js\\|as\\|json\\|jsn\\)\\'" 'javascript-mode))
(autoload 'javascript-mode "javascript" nil t)
(setq js-indent-level 4)


;; Rubyのマニュアル検索
(defun refe (str)
  (interactive "s文字列: ")
  (shell-command (concat "~/junk/download/ruby-refm-1.9.2-dynamic-20110729/refe-1_9_2 " str)))

; qml-mode
;; (add-to-list 'auto-mode-alist (cons  "\\.qml" 'qml-mode))
;; (autoload 'qml-mode "qml-mode" t)
;; (setq-default indent-tabs-mode t) ;; default = nil

(setq-default tab-width 4)

;;
;; whiltespace-mode
;;

(setq whitespace-style
      '(tabs tab-mark spaces space-mark))
(setq whitespace-display-mappings
      '((space-mark ?\x3000 [?\□])
        (tab-mark   ?\t   [?\xBB ?\t])
        ))


(use-package magit)

(setq magit-auto-revert-mode nil)
(setq magit-last-seen-setup-instructions "1.4.0")

;; blockdiag-mode

(use-package "blockdiag-mode")
(setq auto-mode-alist
      (append '(("\\.diag$" . blockdiag-mode)) auto-mode-alist))



;; sphinx

;; Emacs起動時にrst.elを読み込み
(use-package rst)
;; 拡張子の*.rst, *.restのファイルをrst-modeで開く
(setq auto-mode-alist
      (append '(("\\.rst$" . rst-mode)
				("\\.rest$" . rst-mode)) auto-mode-alist))
;; 背景が黒い場合はこうしないと見出しが見づらい
(setq frame-background-mode 'dark)
;; 全部スペースでインデントしましょう
(add-hook 'rst-mode-hook '(lambda() (setq indent-tabs-mode nil)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; web-mode.el

(use-package web-mode)

;;; emacs 23以下の互換
(when (< emacs-major-version 24)
  (defalias 'prog-mode 'fundamental-mode))

;;; 適用する拡張子
(add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.ctp$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))

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


