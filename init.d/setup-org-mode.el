;;; org
(setq org-startup-with-inline-images t)

;;; plantuml
(org-babel-do-load-languages
 'org-babel-load-languages
 '((plantuml . t)))
(setq org-confirm-babel-evaluate nil)
(setq org-plantuml-jar-path
      (expand-file-name "bin/plantuml/plantuml.jar"))
(add-hook 'org-babel-after-execute-hook
	  (lambda ()
	    (when org-inline-image-overlays
	      (org-redisplay-inline-images))))
(add-to-list 'org-structure-template-alist
	                  '("u" "#+BEGIN_SRC plantuml :file ?.png :cmdline -charset UTF-8\n
                    skinparam monochrome true\n#+END_SRC"))

(provide 'setup-org-mode)