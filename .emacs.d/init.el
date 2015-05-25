;; .emacs

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)


(require 'package)
;; MELPAを追加
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

;; Marmaladeを追加
(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/")
)
;; 初期化
(package-initialize)

(require 'use-package)




;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;(setq load-path (cons "/home/banchou/lib/emacs/evernote-mode" load-path))
(setq load-path (cons "/home/banchou/lib/emacs/" load-path))
(setq load-path (cons "/home/banchou/lib/emacs/share/emacs/site-lisp/mew/" load-path))
(setq load-path (cons "/home/banchou/lib/emacs/mew/share/emacs/site-lisp/" load-path))
(setq load-path (cons "/home/banchou/lib/emacs/mew/share/emacs/site-lisp/mew" load-path))

;; (setq load-path (cons "/home/banchou/lib/emacs/w3m" load-path))
;; (setq load-path (cons "/home/banchou/lib/emacs/share/emacs/site-lisp/riece" load-path))

(setq exec-path (cons "/home/banchou/lib/emacs/mew/bin" exec-path))


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
;(define-key ctl-x-map "5" 'evernote-mode)
(define-key ctl-x-map "4" 'magit-status)
;(define-key ctl-x-map ";" 'compile)

(define-key ctl-x-map ":" 'comment-region)
(define-key ctl-x-map ")" 'revert-buffer)


;; php-mode
(load-library "php-mode")
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




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; A sample file of .emacs or a site configuration file
;;;
;
; This is just a sample. You should customize as you like...
;

(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)

;; Optional setup (Read Mail menu for Emacs 21):
;(if (boundp 'read-mail-command)
;    (setq read-mail-command 'mew))

;; Optional setup (e.g. C-xm for sending a message):
;(autoload 'mew-user-agent-compose "mew" nil t)
;(if (boundp 'mail-user-agent)
;    (setq mail-user-agent 'mew-user-agent))
;(if (fboundp 'define-mail-user-agent)
;    (define-mail-user-agent
;      'mew-user-agent
;      'mew-user-agent-compose
;      'mew-draft-send-message
;      'mew-draft-kill
;      'mew-send-hook))

;; If you are using Emacs with the --unibyte option or the
;; EMACS_UNIBYTE environment variable for Latin-1, put the following
;; into your "~/.emacs".
;(set-language-environment "Latin-1")
;(set-input-method "latin-1-prefix") ;; or "latin-1-postfix"
;; You MUST remove (standard-display-european 1) from your .emacs.

;;;
;;; End
;;;

(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                                     interpreter-mode-alist))


(add-hook 'c++-mode-hook '(lambda ()
    (setq c-basic-offset 4)
    (setq c-tab-width 4)
    (setq c-indent-level 4)
    (setq tab-width 4)
	(setq indent-tabs-mode t)
	(setq-default tab-width 4)
))

;; javascript-mode                                                                                                                                                     
(add-to-list 'auto-mode-alist (cons  "\\.\\(qml\\|js\\|as\\|json\\|jsn\\)\\'" 'javascript-mode))
(autoload 'javascript-mode "javascript" nil t)
(setq js-indent-level 4)

;; shokki rule
(setq-default tab-width 8 indent-tabs-mode t)


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
;; (set-face-foreground 'whitespace-tab "LightSlateGray")
;; (set-face-background 'whitespace-tab "DarkSlateGray")


;; evernote-mode

;; (use-package evernote-mode)
;; (setq evernote-username "boneandrea")
;; (setq evernote-enml-formatter-command '("w3m" "-dump" "-I" "UTF8" "-O" "UTF8"))
;; (global-set-key "\C-cec" 'evernote-create-note)
;; (global-set-key "\C-ceo" 'evernote-open-note)
;; (global-set-key "\C-ces" 'evernote-search-notes)
;; (global-set-key "\C-ceS" 'evernote-do-saved-search)
;; (global-set-key "\C-cew" 'evernote-write-note)
;; (global-set-key "\C-cep" 'evernote-post-region)
;; (global-set-key "\C-ceb" 'evernote-browser)

(use-package magit)
(setq magit-auto-revert-mode nil)
(setq magit-last-seen-setup-instructions "1.4.0")


;; evernote-mode 
;(add-to-list 'load-path "~/./elisp/")  ; evernote-mode.el のinstall先



;; blockdiag-mode

(load-library "blockdiag-mode")
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


;;;;;;;;;;;;;;
(autoload 'riece "riece" nil t)



(setq mew-prog-image/*-ext '("eog" ("eog" "%s") t ))


;; swiper.el
(defun isearch-forward-or-swiper (use-swiper)
  (interactive "P")
  (let (current-prefix-arg)
    (call-interactively (if use-swiper 'swiper 'isearch-forward))))
(global-set-key (kbd "C-s") 'isearch-forward-or-swiper)
;;; バックエンドのivyがスペースを".*"に置換してしまうため、無効にする
;;; これをしないと純粋に正規表現isearchの置き換えにならない
(use-package ivy)
(fset 'ivy--regex 'identity)


;; sql-indent
(eval-after-load "sql"
  '(load-library "sql-indent"))
(sql-set-product "mysql")
(put 'downcase-region 'disabled nil)
