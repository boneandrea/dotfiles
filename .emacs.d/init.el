;;; Commentary: .emacs
;;; Package --- summary


(require 'cask "~/.cask/cask.el")

;;; Code:
(cask-initialize)

;; 初期化
(package-initialize)
(require 'use-package)

;; package-selected-packages がinit.elに書かれる問題
;; http://extra-vision.blogspot.com/2016/10/emacs25-package-selected-packages.html
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))


;; mailer
(use-package mew)

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

(global-set-key "\C-xm" 'set-mark-command)


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
(use-package php-mode)

(add-to-list 'auto-mode-alist '("\\.php$"     . php-mode))

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

;; ruby-mode

(use-package ruby-mode)
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                                     interpreter-mode-alist))
(setq ruby-deep-indent-paren-style nil)
(setq ruby-deep-indent-paren nil)

;; no need magic comment
(setq ruby-insert-encoding-magic-comment nil)


;; javascript-mode                                                                                                                                                     

(use-package js2-mode)
(add-to-list 'auto-mode-alist (cons  "\\.\\(qml\\|js\\|as\\|json\\|jsn\\)\\'" 'js2-mode))
(setq js-indent-level 4)

;; Rubyのマニュアル検索
(defun refe (str)
  (interactive "s文字列: ")
  (shell-command (concat "~/junk/download/ruby-refm-1.9.2-dynamic-20110729/refe-1_9_2 " str)))

; qml-mode
;; (add-to-list 'auto-mode-alist (cons  "\\.qml" 'qml-mode))
;; (autoload 'qml-mode "qml-mode" t)
;; (setq-default indent-tabs-mode t) ;; default = nil


;; タブ文字ではなくスペースを使う
(setq-default indent-tabs-mode nil)

;; タブ幅をスペース2つ分にする
(setq-default tab-width 2)

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

(use-package blockdiag-mode)
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

(use-package web-mode
  :mode (("\\.phtml$"     . web-mode)
         ("\\.ctp$"       . web-mode)
         ("\\.tpl\\.php$" . web-mode)
         ("\\.jsp$"       . web-mode)
         ("\\.as[cp]x$"   . web-mode)
         ("\\.slim\\vue$"       . web-mode)
         ("\\.erb$"       . web-mode)
         ("\\.html?$"     . web-mode))
  :config (
           )
  )

;; ;;; 適用する拡張子
;; (add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.ctp$"       . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))

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

;; rjsx-mode タブ設定
(add-to-list 'auto-mode-alist '("\\.js$"     . rjsx-mode))

(add-hook 'rjsx-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil) ;;インデントはタブではなくスペース
            (setq js-indent-level 2) ;;スペースは２つ、デフォルトは4
            (setq js2-strict-missing-semi-warning nil))) ;;行末のセミコロンの警告はオフ


;; coffeeScript
;; (autoload 'coffee-mode "coffee-mode" "Major mode for editing CoffeeScript." t)
;; (add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
;; (add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

;; flycheck
(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq flycheck-checker 'ruby-rubocop)
                          (flycheck-mode 1)))
(define-key ctl-x-map "a" ' flycheck-next-error)
(define-key ctl-x-map "z" ' flycheck-prev-error)

(add-hook 'after-init-hook 'global-flycheck-mode)

;; clang-format
(global-set-key "\C-xcf" 'clang-format)


(add-hook 'java-mode-common-hook
          '(lambda ()
                      (add-hook 'after-save-hook
                                'clang-format-buffer)))


(when (boundp 'indent-rigidly-map)
  ;; 矢印ではなく f b で簡単にインデントできるようにする
  (define-key indent-rigidly-map (kbd "f") 'indent-rigidly-right-to-tab-stop)
  (define-key indent-rigidly-map (kbd "b") 'indent-rigidly-left-to-tab-stop)

  ;; 1文字ずつインデントする方は滅多に使わないので shift 付きにする
  (define-key indent-rigidly-map (kbd "F") 'indent-rigidly-right)
  (define-key indent-rigidly-map (kbd "B") 'indent-rigidly-left)

  ;; C-x C-i を2連続でタイプした場合は使用頻度が高い右タブインデントに割り当て
  (define-key indent-rigidly-map (kbd "C-x TAB") 'indent-rigidly-right-to-tab-stop)

  ;; vi ライクなキーバインドにしたいときは h l を使うのもいいかも
  ;; (define-key indent-rigidly-map (kbd "l") 'indent-rigidly-right-to-tab-stop)
  ;; (define-key indent-rigidly-map (kbd "h") 'indent-rigidly-left-to-tab-stop)
  )


;; markdown-mode
(use-package web-mode
  :mode (("\\.md$"     . markdown-mode))
  :config (
           )
)

;; reload updated buffers
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive) (revert-buffer t t))
(global-set-key (kbd "C-c C-r") 'revert-buffer-no-confirm)
(global-auto-revert-mode 1)

;;
;; (require 'ruby-electric)
;; (add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
;; (setq ruby-electric-expand-delimiters-list nil)
(put 'downcase-region 'disabled nil)


;; arduino
(use-package arduino-mode)


;; use tab instead of spaces when Makefile-mode
(add-hook 'makefile-mode-hook
  (function (lambda ()
    (setq indent-tabs-mode t))))


(eval-after-load "sql"
  '(load-library "sql-indent"))


