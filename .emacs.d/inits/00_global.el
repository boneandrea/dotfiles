;;; Package --- common configure
;;; Commentary:
;;; Code:

;; 点滅不要
;; https://ayatakesi.github.io/emacs/26.1/html/Cursor-Display.html
(setq visible-cursor nil)

;; enable font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;; elispが配布されてる場合
(setq load-path (cons "~/.emacs.d/elisp" load-path))

;; import $ENV["PATH"]
(use-package exec-path-from-shell)
(setq exec-path-from-shell-check-startup-files nil)
(exec-path-from-shell-initialize)

;; mailer
(use-package mew)

;; モードラインがあふれる
(use-package diminish)

;; enable visual feedback on selections
;;(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format (concat  "%b - emacs@" system-name))

;; Charset
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

;; display-time

(setq display-time-24hr-format t)
(setq display-time-string-forms '((if display-time-day-and-date
                                      (format "%s/%s/%s " year month day)
                                    "")
                                  (format "%s:%s%s"
                                          (if display-time-24hr-format 24-hours 12-hours)
                                          minutes
                                          (if display-time-24hr-format "" am-pm))))


(display-time)
(setq visible-bell t)

(global-set-key "\C-xm" 'set-mark-command)

;; no need backup file
(setq make-backup-files nil)

;; magit
(use-package magit)
(setq magit-auto-revert-mode nil)

;; do not use \t but \s
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; whiltespace-mode
(setq whitespace-style
      '(tabs tab-mark spaces space-mark))
(setq whitespace-display-mappings
      '((space-mark ?\x3000 [?\□])
        (tab-mark   ?\t   [?\xBB ?\t])
        ))


;; flycheck
(use-package flycheck)
(define-key ctl-x-map "a" ' flycheck-next-error)
(define-key ctl-x-map "z" ' flycheck-prev-error)
(add-hook 'after-init-hook 'global-flycheck-mode)

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
(use-package markdown-mode
  :mode (("\\.md$"     . markdown-mode))
  :config (
           )
  )

;; auto reload updated buffers
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
;(use-package arduino-mode)

;; use tab instead of spaces when Makefile-mode
(add-hook 'makefile-mode-hook
          (function (lambda ()
                      (setq indent-tabs-mode t))))


(eval-after-load "sql"
  '(load-library "sql-indent"))


;; global-key

(global-set-key "\C-h" 'delete-backward-char)

(define-key ctl-x-map "6" 'goto-line)
(define-key ctl-x-map "7" 'calendar)
(define-key ctl-x-map "8" 'mew)
(define-key ctl-x-map "0" 'global-whitespace-mode)
(define-key ctl-x-map "4" 'magit-status)
(define-key ctl-x-map ";" 'compile)

(define-key ctl-x-map ":" 'comment-region)
(define-key ctl-x-map ")" 'revert-buffer)

;; https://qiita.com/yynozk/items/f5ccc2b027a9aaa13fe4
(cond (window-system
       (setq x-select-enable-clipboard t)
       ))


;; 行末スペース削除するが
(defvar delete-trailing-whitespece-before-save t)
(defun my-delete-trailing-whitespace ()
  (if delete-trailing-whitespece-before-save
      (delete-trailing-whitespace)))
(add-hook 'before-save-hook 'my-delete-trailing-whitespace)

;; markdown modeではdeleteしたくないので
;; 無効にしたいモードのhook
(add-hook 'markdown-mode-hook
          '(lambda ()
             (set (make-local-variable 'delete-trailing-whitespece-before-save) nil)))

;; (add-hook 'before-save-hook 'delete-trailing-whitespace)
;; (defvar delete-trailing-whitespece-before-save t)
;; (make-variable-buffer-local 'delete-trailing-whitespece-before-save)
;; (advice-add 'delete-trailing-whitespace :before-while
;;                         (lambda () delete-trailing-whitespece-before-save))

;; (load-library "hideshow")
;; (autoload 'hideshowvis-enable "hideshowvis" "Highlight foldable regions")
;; (dolist (hook (list 'emacs-lisp-mode-hook
;;                     'c++-mode-hook
;;                     'JSON-mode-hook
;;                     'json-mode-hook
;;                     'javascript-mode-hook
;;                     'python-mode-hook))
;;   (add-hook hook 'hideshowvis-enable))

;; (add-to-list 'folding-mode-marks-alist (JSON-mode "// {{{" "// }}}"))


(use-package vimish-fold)

(global-set-key (kbd "\C-ccf")    'vimish-fold)
(global-set-key (kbd "\C-c f")    'vimish-fold-toggle)
(global-set-key (kbd "\C-cdf")    'vimish-fold-delete-all)

(use-package nginx-mode)
(add-to-list 'auto-mode-alist '("nginx\\(.*\\).conf[^/]*$" . nginx-mode))


;; docker
(use-package docker)
(use-package dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
(use-package docker-compose-mode)
(use-package docker-tramp)
(set-variable 'docker-tramp-use-names t)

;; tramp
(setq tramp-auto-save-directory "/tmp")

;; editorconfig
(use-package editorconfig)
(editorconfig-mode 1)

;; yafolding https://github.com/zenozeng/yafolding.el
(defvar yafolding-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "<C-S-return>") #'yafolding-hide-parent-element)
    (define-key map (kbd "<C-M-return>") #'yafolding-toggle-all)
    (define-key map (kbd "M-RET") #'yafolding-toggle-element)
    map))

(use-package yafolding)
(add-hook 'prog-mode-hook
          (lambda () (yafolding-mode)))

(use-package yasnippet
  :straight t
  :diminish yas-minor-mode
  :bind (:map yas-minor-mode-map
              ("C-c s i" . yas-insert-snippet)  ; 既存へ挿入
              ("C-c s n" . yas-new-snippet)     ; 新規作成
              ("C-c s v" . yas-visit-snippet-file)  ; 既存の閲覧編集
              ("C-c s l" . yas-describe-tables) ; 選択可能なスニペットの一覧表示
              ("C-c s g" . yas-reload-all))
  :config
  (yas-global-mode 1)
  (setq yas-prompt-functions '(yas-ido-prompt))
  )

(use-package yasnippet-snippets)

(setq ad-redefinition-action 'accept)

;; https://qiita.com/lanevok/items/88f726213b494d1fb811
;; EmacsでBackspace入力しているがDelete挙動になる場合の解決方法
(normal-erase-is-backspace-mode 0)

(provide '00_all)
;;; 00_all ends here
