;;; Package --- summary
;;; Commentary:
;;; Code:

;
; clang-format
(require 'py-autopep8)
(setq py-autopep8-options '("--max-line-length=200"))
(add-hook 'before-save-hook 'py-autopep8-before-save)

;;; ends here
