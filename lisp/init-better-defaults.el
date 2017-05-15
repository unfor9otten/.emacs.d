;;  ___  __    ___  __   __
;; |__  |  \ |  |  /  \ |__)
;; |___ |__/ |  |  \__/ |  \
;;  __   ___  ___                ___
;; |  \ |__  |__   /\  |  | |     |
;; |__/ |___ |    /~~\ \__/ |___  |
;; Better Default
;; ==================================================================

;; Default UTF-8 Encoding
(set-language-environment "UTF-8")

(prefer-coding-system 'utf-8)

;; Disable Backup File
(setq make-backup-files nil)

;; Disable Auto-save File
;;(setq auto-save-default nil)

;; Regular Replace Selection Behavior
(delete-selection-mode 1)

;; Auto Parenthesis Matching
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; Linewrap
(global-visual-line-mode 1)

;; Enable Recent Files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

;; Load Editor Theme
(load-theme 'atom-one-dark t)
;; (load-theme 'github t)

;; (load-theme 'solarized-light 1)

;; Disable Warning Bell
(setq ring-bell-function 'ignore)

;; Auto Reload File
(global-auto-revert-mode t)

;; Set Short Cut for (yes-or-no)
(fset 'yes-or-no-p 'y-or-n-p)

;; Abbreviation Mode and Setting
(abbrev-mode 1)
(define-abbrev-table 'global-abbrev-table '(
					    ("3lxy" "li-xinyang")
					    ))

;; Hippie Complete Function Lists
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-all-abbrevs
                                         try-expand-list
                                         try-expand-line
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol))

;; Single ' When Editing Lisp
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
(sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)

;; Highlight parens when inside it
(defadvice show-paren-function (around fix-show-paren-function activate)
  (cond ((looking-at-p "\\s(") ad-do-it)
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     ad-do-it))))

;; Better Occur Mode
(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
            (buffer-substring-no-properties
             (region-beginning)
             (region-end))
          (let ((sym (thing-at-point 'symbol)))
            (when (stringp sym)
              (regexp-quote sym))))
        regexp-history)
  (call-interactively 'occur))

;; Better iMenu Mode
(defun js2-imenu-make-index ()
  (interactive)
  (save-excursion
    ;; (setq imenu-generic-expression '((nil "describe\\(\"\\(.+\\)\"" 1)))
    (imenu--generic-function '(("describe" "\\s-*describe\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
			       ("it" "\\s-*it\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
			       ("test" "\\s-*test\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
			       ("before" "\\s-*before\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
			       ("after" "\\s-*after\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
			       ("Function" "function[ \t]+\\([a-zA-Z0-9_$.]+\\)[ \t]*(" 1)
			       ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
			       ("Function" "^var[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
			       ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*()[ \t]*{" 1)
			       ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*:[ \t]*function[ \t]*(" 1)
			       ("Task" "[. \t]task([ \t]*['\"]\\([^'\"]+\\)" 1)))))
(add-hook 'js2-mode-hook
	  (lambda ()
	    (setq imenu-create-index-function 'js2-imenu-make-index)))

;; Better Dired Mode
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

(put 'dired-find-alternate-file 'disabled nil)

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(require 'dired-x)
(setq dired-dwim-target t)

;; shell script support
(when *IS-LINUX*
  (defalias 'sh 'shell))
	
(when *IS-WINDOWS*
  (defalias 'sh 'shell)
  (let* ((git-dir "C:/Program Files/Git")
         (bash-dir (concat (file-name-as-directory git-dir) "bin")))
    (setq explicit-shell-file-name (concat (file-name-as-directory bash-dir)
                                           "bash.exe"))
    (setq shell-file-name explicit-shell-file-name)
    (add-to-list 'exec-path git-dir)
    (add-to-list 'exec-path bash-dir)
    (setq explicit-bash.exe-args '("--noediting" "--login" "-i"))
    (setenv "SHELL" shell-file-name)
    (setenv "PATH" (concat git-dir path-separator
                           (concat bash-dir path-separator (getenv "PATH"))))))


(provide 'init-better-defaults)
