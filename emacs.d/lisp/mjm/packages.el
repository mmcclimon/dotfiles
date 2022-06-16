(provide 'mjm/packages)
(setq lexical-binding t)

; clean up lighters of modes that are always on.
(use-package delight
  :ensure t
  :config
  (delight 'auto-fill-function " ↩" t)
  (delight 'abbrev-mode " ." t))

(use-package uniquify
  :defer t
  :config
  (setq uniquify-buffer-name-style 'forward))

(use-package saveplace
  :defer t
  :config
  (setq-default save-place t)
  (setq save-place-file (concat user-emacs-directory "places")))

(use-package magit
  :ensure t
  :defer t
  :init
  (setq magic-process-connection-type nil
        magic-git-executable "/opt/local/bin/git")
  (global-set-key (kbd "C-c G") 'magit-status))

(use-package paredit
  :ensure t
  :defer t)

(use-package avy
  :ensure t
  :defer t)
