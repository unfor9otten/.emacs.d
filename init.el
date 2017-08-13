;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(defconst *IS-WINDOWS* (eq system-type 'windows-nt))
(defconst *IS-LINUX* (eq system-type 'gnu/linux))
(defconst *DOC-HOME-PATH* "~/org")
(defconst *ORG-MAIN-FILE* "~/org/todos.org")

(package-initialize)

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode 1)

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Package Management
;; -----------------------------------------------------------------
(require 'init-packages)

;; Helper Functions
;; -----------------------------------------------------------------
(require 'init-helper)

;; UI Related
;; -----------------------------------------------------------------
(require 'init-ui)

;; Better Editor Default
;; -----------------------------------------------------------------
(require 'init-better-defaults)

;; Keybindings
;; -----------------------------------------------------------------
(require 'init-keybindings)

;; Org
;; -----------------------------------------------------------------
(require 'init-org)

;; Private config
;; -----------------------------------------------------------------
(require 'init-private)


;; Custom
;; -----------------------------------------------------------------
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)
(put 'upcase-region 'disabled nil)
