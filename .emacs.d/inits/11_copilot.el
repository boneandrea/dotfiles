;;; package --- Copilot
;;; Commentary:
;;; Code:

(use-package copilot
  :straight (:host github :repo "copilot-emacs/copilot.el" :files ("*.el"))
  :ensure t)
(add-to-list 'load-path "/home/banchou/.emacs.d/straight/build/copilot/copilot.el")
(require 'copilot)

(add-hook 'prog-mode-hook 'copilot-mode)
(define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
(define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)

(provide '11_copilot);;;
