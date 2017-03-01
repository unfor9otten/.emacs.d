;; https://www.gnu.org/software/emacs/manual/html_node/elisp/System-Environment.html
;; system-type settings
(defconst *is-windows* (eq system-type 'windows-nt))
(defconst *is-linux* (eq system-type 'gnu/linux))
(defconst *doc-home-path* "~/doc-home")

(when *is-linux*
  (set-language-environment "utf-8"))

(prefer-coding-system 'utf-8)

(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))


(package-initialize)
(unless (file-exists-p "~/.emacs.d/elpa/archives/melpa") (package-refresh-contents))

(package-install 'use-package)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'org-install)
(require 'ob-tangle)

(defvar ufn-config-dir
  (file-name-directory (or load-file-name (buffer-file-name))))

(defun ufn-load-org (s)
  (org-babel-load-file
   (expand-file-name (format "%s.org" s) ufn-config-dir)))

(defun ufn-init-load-org (s)
  (ufn-load-org (format "init.d/init-%s" s)))

;; private extension load
(defvar private-extension-file (concat *doc-home-path* "/private/extension-load"))

(add-hook
 'after-init-hook
 (lambda ()
   (ufn-init-load-org "emacs-customize")
   (ufn-init-load-org "org")
   (ufn-init-load-org "helm")


   (when (file-exists-p (concat private-extension-file ".org"))
     (ufn-load-org private-extension-file))
   )
 )
