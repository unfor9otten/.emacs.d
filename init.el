(defconst *IS-WINDOWS* (eq system-type 'windows-nt))
(defconst *IS-LINUX* (eq system-type 'gnu/linux))
(defconst *DOC-HOME-PATH* "~/org")
(defconst *ORG-MAIN-FILE* "~/org/management/notes.org")

(package-initialize)

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode 1)

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; 기본 환경설정
;; -----------------------------------------------------------------
(require 'init-config)

;; Package Management
;; -----------------------------------------------------------------
(require 'init-packages)

;; Helper Functions
;; -----------------------------------------------------------------
(require 'init-helper)

;; UI Related
;; -----------------------------------------------------------------
(require 'init-ui)

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
