
;;; https://github.com/bbatsov/solarized-emacs
(use-package atom-one-dark-theme
	     :ensure t
	     :config
	     (load-theme 'atom-one-dark t))

;; use specific font for Korean charset.
;; if you want to use different font size for specific charset,
;; add :size POINT-SIZE in the font-spec.
(set-fontset-font t 'hangul (font-spec :name "NanumGothicCoding"))
		 
(provide 'setup-font)
