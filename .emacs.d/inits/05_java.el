;;; Package --- summary
;;; Commentary:
;;; Code:

(use-package groovy-mode)
;
; clang-format
(global-set-key "\C-xcf" 'clang-format)

(add-hook 'java-mode-hook
          '(lambda ()
             (setq indent-tabs-mode nil)
             (setq c-basic-offset 2)
             ))

(add-hook 'java-mode-hook
         '(lambda ()
            (add-hook 'before-save-hook
                      'clang-format-buffer
                      'nil
                      'local
                      )))

;;; ends here
