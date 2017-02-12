;; * CUSTOM KEYBINDINGS *

(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'sh 'shell)

;; M-x - C-xC-m
(global-set-key "\C-x\C-m" 'execute-extended-command)



;;; emacs-lisp-mode
(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (define-key emacs-lisp-mode-map "\C-c\C-c" 'eval-defun)))

;;; lisp-interaction-mode
(add-hook 'lisp-interaction-mode-hook
	  (lambda ()
	    (define-key lisp-interaction-mode-map "\C-c\C-c" 'eval-defun)))


(provide 'key-bindings)
