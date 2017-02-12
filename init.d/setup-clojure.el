(use-package clojure-mode
  :ensure t)

  ;;; Integrated REPL environment
  (use-package cider
    :ensure t
    :config
    (add-hook 'clojure-mode-hook 'cider-mode)
    (use-package cider-eval-sexp-fu :ensure t)
    (use-package clj-refactor
      :ensure t
      :config
      (add-hook 'clojure-mode-hook 'clj-refactor-mode)
      (add-hook 'cider-repl-mode-hook 'clj-refactor-mode)
      (cljr-add-keybindings-with-prefix "H-m")
      (setq cljr-warn-on-eval nil)))

(provide 'setup-clojure)
