;; * SETUP PACKAGES *

;;;;;;;;;;;;;
;; projectile
;; IDO-like navigation
(use-package helm :ensure t
  :config
  (helm-mode 1)
  (use-package helm-ag :ensure t)
  (use-package helm-projectile :ensure t))
(require 'projectile)
(require 'helm-projectile)
(projectile-global-mode)
(global-set-key (kbd "C-x p") 'helm-projectile)


(provide 'setup-packages)
