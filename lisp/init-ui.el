;;       __   __   ___       __             __   ___
;;  /\  |__) |__) |__   /\  |__)  /\  |\ | /  ` |__
;; /~~\ |    |    |___ /~~\ |  \ /~~\ | \| \__, |___
;; Appearance Related Setting
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
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(when *IS-WINDOWS*
 (set-face-attribute 'default nil :family "Consolas" :height 110))

(set-fontset-font t 'hangul (font-spec :name "NanumGothicCoding"))

;; Load Editor Theme
(load-theme 'github t)
(disable-theme 'github)
;;(load-theme 'zerodark t)
(load-theme 'atom-one-dark t)
;;(load-theme 'monokai t)

;; (load-theme 'solarized-light 1)


(provide 'init-ui)
