(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
 (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))

;; cl - Common Lisp Extension
(require 'cl)

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; Package Related Setting
;; ===================================================================

;; Enable Relative Line Number
;; -------------------------------------------------------------------
;; (require 'linum-relative)
;; (linum-relative-global-mode)

;; Evil Mode Setting
;; -------------------------------------------------------------------
;; (require 'evil)
;; (evil-mode 1)
;; (setcdr evil-insert-state-map nil)

;; Evil Leader Key
;; -------------------------------------------------------------------
;; (global-evil-leader-mode)

;; which-key
;; -------------------------------------------------------------------
(which-key-mode t)
;; Match file type to Major Modes
;; -------------------------------------------------------------------
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))    ;; *.js   -> js2-mode
       '(("\\.html\\'" . web-mode))  ;; *.html -> web-mode
       '(("\\.jsx\\'" . web-mode))   ;; *.jsx  -> web-mode
       '(("\\.hbs\\'" . web-mode))   ;; *.hbs  -> web-mode
       auto-mode-alist))

;; Company Mode
;; -------------------------------------------------------------------
;; Enable global company mode
(global-company-mode t)
(setq company-dabbrev-downcase nil)

;; Hungry-delete
;; -------------------------------------------------------------------
;; Enable global hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode t)

;; Smartparens
;; -------------------------------------------------------------------
(require 'smartparens-config)
(smartparens-global-mode t)

;; Ivy-mode
;; -------------------------------------------------------------------
(ivy-mode t)
(setq ivy-use-virtual-buffers t)

;; Deft
;; -------------------------------------------------------------------
;; Set default Deft note file type
;; (setq deft-extensions '("md" "org" "txt" "tex"))
;; (setq deft-directory "~/.deft/")
(setq
    deft-extension "org"
    deft-directory "~/doc-home/"
    deft-text-mode 'org-mode
    deft-use-filename-as-title t)

;; js2-mode
;; -------------------------------------------------------------------
;; Enable js2-mode for JavaScript File

;; js2-refactor
;; -------------------------------------------------------------------
;; (add-hook 'js2-mode-hook #'js2-refactor-mode)

;; web-mode
;; -------------------------------------------------------------------
;; Set web-mode code indentations
(defun my-web-mode-indent-setup()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

;; markdown-mode
;; -------------------------------------------------------------------
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; popwin
;; -------------------------------------------------------------------
(require 'popwin)
(popwin-mode t)

;; yasnippet
;; -------------------------------------------------------------------
;; (yas-reload-all)
;; (add-hook 'prog-mode-hook #'yas-minor-mode)

(provide 'init-packages)
