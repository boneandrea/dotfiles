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
(require 'ruby-block)
(setq ruby-block-highlight-toggle t)
(defun ruby-mode-hook-ruby-block()
  (ruby-block-mode t))
(add-hook 'ruby-mode-hook 'ruby-mode-hook-ruby-block)
                                        ; ruby-block-delay を0.50 → 0に設定
(defcustom ruby-block-delay 0
  "*Time in seconds to delay before showing a matching paren."
  :type  'number
  :group 'ruby-block)

;; no need magic comment
(setq ruby-insert-encoding-magic-comment nil)


(autoload 'rspec-mode "rspec-mode")
(add-hook 'ruby-mode-hook 'rspec-mode)


(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq flycheck-checker 'ruby-rubocop)
             (flycheck-mode 1)))
