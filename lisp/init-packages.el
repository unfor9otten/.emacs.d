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
(require 'evil)
;;(require 'org-evil)
(setq evil-want-C-u-scroll t)
(setq evil-want-C-w-in-emacs-state t)
(setq evil-want-C-w-delete nil)
(evil-mode t)
  (evil-set-initial-state 'calendar-mode 'emacs)
  (evil-set-initial-state 'calculator-mode 'emacs)
  (evil-set-initial-state 'git-rebase-mode 'emacs)
  (evil-set-initial-state 'finder-mode 'emacs)
  (evil-set-initial-state 'Man-mode 'emacs)
  (evil-set-initial-state 'helm-ag-mode 'emacs)
  (evil-set-initial-state 'ert-results-mode 'emacs)
  (evil-set-initial-state 'ert-simple-view-mode 'emacs)
  (evil-set-initial-state 'process-menu-mode 'emacs)
  (setq-default evil-symbol-word-search t)

  (add-hook 'emacs-lisp-mode-hook
            #'(lambda ()
                (modify-syntax-entry ?_ "w")
                (modify-syntax-entry ?- "w")))
  (add-hook 'c-mode-common-hook
            #'(lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'elixir-mode-hook
            #'(lambda ()
                (modify-syntax-entry ?_ "w")
                (modify-syntax-entry ?: ".")
                (modify-syntax-entry ?% ".")))

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
 deft-directory "~/org/"
 deft-text-mode 'org-mode
 deft-use-filename-as-title t)


(defun deft-work-loading()
  (interactive)
  (setq deft-directory "~/org/work/")
  (deft-refresh)
  )


(defun deft-all-loading()
  (interactive)
  (setq deft-directory "~/org/")
  (deft-refresh)
  )


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
