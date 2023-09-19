;;; Package --- ruby specific
;;; Commentary:
;;; Code:

(use-package ruby-mode)
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                                     interpreter-mode-alist))
(setq ruby-deep-indent-paren-style nil)
(setq ruby-deep-indent-paren nil)

;; ruby-block
(use-package ruby-block)
(use-package ruby-electric)
(setq ruby-block-highlight-toggle t)
(defun ruby-mode-hook-ruby-block()
  (ruby-block-mode t))
(add-hook 'ruby-mode-hook (lambda()
                            (company-mode)
                            (setq company-auto-expand t)
                            (setq company-transformers '(company-sort-by-backend-importance)) ;; ソート順
                            (setq company-idle-delay 0) ; 遅延なしにすぐ表示
                            (setq company-minimum-prefix-length 1) ; 何文字打つと補完動作を行うか設定
                            (setq company-selection-wrap-around t) ; 候補の最後の次は先頭に戻る
                            (setq completion-ignore-case t)
                            (ruby-electric-mode)
                            (setq company-dabbrev-downcase nil)
                            (global-set-key (kbd "C-M-i") 'company-complete)
                            ;; C-n, C-pで補完候補を次/前の候補を選択
                            (define-key company-active-map (kbd "C-n") 'company-select-next)
                            (define-key company-active-map (kbd "C-p") 'company-select-previous)
                            (define-key company-active-map (kbd "C-s") 'company-filter-candidates) ;; C-sで絞り込む
                            (define-key company-active-map [tab] 'company-complete-selection) ;; TABで候補を設定
                            (define-key emacs-lisp-mode-map (kbd "C-M-i") 'company-complete) ;; 各種メジャーモードでも C-M-iで company-modeの補完を使う
                            ))
                                        ; ruby-block-delay を0.50 → 0に設定
(defcustom ruby-block-delay 0
  "*Time in seconds to delay before showing a matching paren."
  :type  'number
  :group 'ruby-block)

;; no need magic comment
(setq ruby-insert-encoding-magic-comment nil)


(use-package rspec-mode)
(autoload 'rspec-mode "rspec-mode")
(add-hook 'ruby-mode-hook 'rspec-mode)


(setq flycheck-checker-error-threshold 24000)
(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq flycheck-checker 'ruby-rubocop)
             (flycheck-mode 1)))

;; ruby-mode 時に rinari-minor-mode も発火させる
(use-package rinari)
(add-hook 'ruby-mode-hook 'rinari-minor-mode)

;; rspec-mode 用の snippet を認識させる
(eval-after-load 'rspec-mode
  '(rspec-install-snippets))
