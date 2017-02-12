(setq windows? (eq system-type 'windows-nt))

;;; shell
(when windows?
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
			   
(provide 'setup-shell)