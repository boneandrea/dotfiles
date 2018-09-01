;; javascript-mode                                                                                                                                                     

(use-package js2-mode)
(add-to-list 'auto-mode-alist (cons  "\\.\\(qml\\|js\\|as\\|json\\|jsn\\)\\'" 'js2-mode))
(setq js-indent-level 4)


(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq flycheck-checker 'ruby-rubocop)
                          (flycheck-mode 1)))
