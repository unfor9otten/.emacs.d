(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/"))) ;; no https :(

(package-initialize)
(unless (file-exists-p "~/.emacs.d/elpa/archives/melpa") (package-refresh-contents))
(package-install 'use-package)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path (expand-file-name "init.d" user-emacs-directory))

(require 'setup-emacs)
(require 'setup-packages)
(require 'setup-mode-packages)

(require 'setup-clojure)
;;(require 'setup-javascript)
;;(require 'setup-web)
(require 'setup-org-mode)
(require 'setup-shell)
(require 'setup-font)

(require 'key-bindings)
