;; 한글
(set-language-environment "Korean")

(prefer-coding-system 'utf-8)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")))

(package-initialize)
(unless (file-exists-p "~/.emacs.d/elpa/archives/melpa") (package-refresh-contents))

(package-install 'use-package)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path (expand-file-name "init.d" user-emacs-directory))

;; https://www.gnu.org/software/emacs/manual/html_node/elisp/System-Environment.html
;; system-type settings
(defconst *is-windows* (eq system-type 'windows-nt))
(defconst *is-linux* (eq system-type 'gnu/linux))


(require 'org-install)
(require 'ob-tangle)

(defvar ufn-config-dir
  (file-name-directory (or load-file-name (buffer-file-name))))

(defun ufn-load-org (s)
  (org-babel-load-file
   (expand-file-name (format "init.d/init-%s.org" s) ufn-config-dir)))

(add-hook
 'after-init-hook
 (lambda ()
   (ufn-load-org "emacs-customize")
   (ufn-load-org "org")
   (ufn-load-org "helm")
   ))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (helm-ag helm-swoop helm-projectile helm org-pomodoro org-fstree ox-gfm company-flx company paredit feature-mode yaml-mode atom-one-dark-theme use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
