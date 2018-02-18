;; UI
;; ===================================================================
;; Hide Startup screen
(setq inhibit-splash-screen t)
;; Default Full-screen Mode
;; (setq initial-frame-alist (quote ((fullscreen . maximized))))
;; Hide menu bar
(tool-bar-mode -1)
;; Hide scroll bar
(scroll-bar-mode -1)
;; Highlight Current Line
(global-hl-line-mode t)
;; Show line number
(global-linum-mode t)
;; Change cursor style
(setq-default cursor-type 'bar)
;; Change Font-size
(when *IS-WINDOWS*
 (set-face-attribute 'default nil :family "Consolas" :height 120))
;; (set-face-attribute 'default nil :family "NanumGothicCoding" :height 120))

;;(set-fontset-font t 'hangul (font-spec :name "NanumGothicCoding"))

(require 'atom-one-dark-theme)
(load-theme 'atom-one-dark t)

(provide 'init-ui)
