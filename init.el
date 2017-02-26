;; 한글
(set-language-environment "utf-8")

(prefer-coding-system 'utf-8)

(setq package-archives
      '(
	("gnu" . "https://elpa.gnu.org/packages/")
	("melpa" . "https://melpa.org/packages/")))

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
   (ufn-load-org "helm")))
