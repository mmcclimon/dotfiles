;; processes.el
;;
;; Settings for miscellaneous process that interact with Emacs (git, ispell,
;; etc.)

; aspell
(setq-default ispell-program-name "aspell")
(setq ispell-list-command "--list")

;; Magit
(setq magit-process-connection-type nil
      magit-git-executable "/usr/local/bin/git")
(global-set-key (kbd "C-c G") 'magit-status)
