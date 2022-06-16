(provide 'mjm/colors)
(setq lexical-binding t)

(use-package gruvbox-theme :ensure t)

(defun load-gruvbox ()
  (interactive)
  (mapcar #'disable-theme custom-enabled-themes)    ; clear old theme out
  (load-theme 'gruvbox t))

(load-gruvbox)
