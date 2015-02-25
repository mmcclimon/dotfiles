;;; Emacs Init File
;;
;; Everything useful is in its own file (this file was getting slightly out of
;; hand).


(load-file (concat user-emacs-directory "mjm-packages.el"))
(load-file (concat user-emacs-directory "ui.el"))
(load-file (concat user-emacs-directory "text-editing.el"))
(load-file (concat user-emacs-directory "keybindings.el"))
(load-file (concat user-emacs-directory "filetypes.el"))
(load-file (concat user-emacs-directory "processes.el"))

; custom stuff in last
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

; start server here, in main init file
(server-start)

;; Local Variables:
;; mode: emacs-lisp
;; End:
