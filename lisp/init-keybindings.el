;; Key Binding
;; ===================================================================
;; Quick Open Config File (init.el)
(global-set-key (kbd "<f2>") 'open-init-file)

;; indent-buffer
(global-set-key (kbd "<f12>") 'indent-buffer)

;; Open Recent Files List
;; (global-set-key (kbd "C-x C-r") 'recentf-open-files)

;; Better Find Definition for Vairbale, Function and Key Binding
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; Swiper
;; -------------------------------------------------------------------
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)

;; Counsel
;; -------------------------------------------------------------------
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
(global-set-key (kbd "C-c p f") 'counsel-git)

;; keyboard change
;; -------------------------------------------------------------------
(global-set-key (kbd "<kana>") 'toggle-input-method)
(global-set-key (kbd "S-SPC") 'toggle-korean-input-method)

;; Deft
;; -------------------------------------------------------------------
(global-set-key (kbd "<f8>") 'deft)

;; Org-mode Related Key Binding
;; -------------------------------------------------------------------
;; Org mode agenda vide default key binding
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c b") 'org-iswitchb)
(global-set-key (kbd "C-c r") 'org-capture)
(global-set-key (kbd "<f5>") (lambda() (interactive) (find-file *ORG-MAIN-FILE*)))


;;; Occur Mode
;; -------------------------------------------------------------------
(global-set-key (kbd "M-s o") 'occur-dwi)

;;; iMenu Mode
;; -------------------------------------------------------------------
(global-set-key (kbd "M-s i") 'counsel-imenu)

;;; iEdit Mode
;; -------------------------------------------------------------------
(global-set-key (kbd "M-s e") 'iedit-mode)

;;; helm-ag
;; -------------------------------------------------------------------
(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)

;;; Neotree
;; -------------------------------------------------------------------
;; (global-set-key (kbd "C-\\") 'neotree-toggle)


;;; emacs-lisp-mode
;; -------------------------------------------------------------------
(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (define-key emacs-lisp-mode-map "\C-c\C-c" 'eval-defun)))

;;; lisp-interaction-mode
;; -------------------------------------------------------------------
(add-hook 'lisp-interaction-mode-hook
          (lambda ()
            (define-key lisp-interaction-mode-map "\C-c\C-c" 'eval-defun)))

;; global go to
;; -------------------------------------------------------------------
(global-set-key (kbd "M-g") 'goto-line)


;;(global-set-key [f9] 'neotree-toggle)

(provide 'init-keybindings)
