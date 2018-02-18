;; Helper Functions
;; ===================================================================

;; Open Config Files (init.el)
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; Code Indent
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer. "
 (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented selected region."))
      (progn
	(indent-buffer)
	(message "Indented buffer.")))))

;; Hide ^M Char
(defun hidden-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

;; Delete ^M Char
(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with UNIX eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil 1) (replace-match "")))

;;; http://emacsredux.com/blog/2013/03/27/copy-filename-to-the-clipboard/
(defun copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'ranger-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))

(defun unity-open-editor-log ()
  (interactive)
  (let ((path (format "C:/Users/%s/AppData/Local/Unity/Editor/Editor.log"
                      (getenv "USERNAME"))))
    (if (file-exists-p path)
        (progn
          (find-file path)
          (auto-revert-tail-mode 1)
          (read-only-mode 1)
          (goto-char (point-max)))
      (message (concat "log file not found - " path)))))

(defun jekyll-default-image ()
  (interactive)
  (let ((name (format "{{ site.asseturl }}/%s-00.jpg"
                      (file-name-base (buffer-file-name)))))
    (kill-new name)
    (message "Copied default image name '%s' to the clipboard." name)))

;; sql
;;(add-to-list 'company-backends 'company-edbi)
(defun upcase-sql-keywords ()
  (interactive)
  (save-excursion
    (dolist (keywords sql-mode-postgres-font-lock-keywords)
      (goto-char (point-min))
      (while (re-search-forward (car keywords) nil t)
	(goto-char (+ 1 (match-beginning 0)))
	(when (eql font-lock-keyword-face (face-at-point))
	  (backward-char)
	  (upcase-word 1)
	  (forward-char))))))

(defun my-sql-save-history-hook ()
  (let ((lval 'sql-input-ring-file-name)
	(rval 'sql-product))
    (if (symbol-value rval)
	(let ((filename
	       (concat "~/.emacs.d/sql/"
		       (symbol-name (symbol-value rval))
		       "-history.sql")))
	  (set (make-local-variable lval) filename))
      (error
       (format "SQL history will not be saved because %s is nil"
	       (symbol-name rval))))))

(add-hook 'sql-interactive-mode-hook 'my-sql-save-history-hook)

;; http://emacsredux.com/blog/2013/04/02/move-current-line-up-or-down/
(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

(global-set-key [(control shift up)]  'move-line-up)
(global-set-key [(control shift down)]  'move-line-down)

(provide 'init-helper)
