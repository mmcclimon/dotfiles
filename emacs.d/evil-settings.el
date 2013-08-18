;;;; Custom evil settings

(require 'surround)
(setq evil-default-cursor t)

;; EasyMotion-like jumping
(define-key evil-normal-state-map (kbd ",f") 'ace-jump-mode)

; add a toggle
(global-set-key (kbd "C-x C-v")
                (lambda () (interactive)
                  (if evil-mode
                      (progn
                        (evil-mode 0)
                        (undo-tree-mode -1)
                        (message "evil-mode off"))
                    (progn
                      (evil-mode 1)
                      (undo-tree-mode 1)
                      (message "evil-mode on")))))


;;; Keybindings

(define-key evil-normal-state-map (kbd "C-e") 'move-end-of-line)
(define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)

;; Make C-v/M-v behave like emacs defaults (C-S-v starts visual block)
(define-key evil-normal-state-map (kbd "C-v") 'evil-scroll-page-down)
(define-key evil-normal-state-map (kbd "M-v") 'evil-scroll-page-up)
(define-key evil-normal-state-map (kbd "C-S-v") 'evil-visual-block)


;; if in insert mode, make left option insert a special character
;; (like Mac default...right option still gets you a meta key
(add-hook 'evil-insert-state-entry-hook
          (lambda ()
            (setq mac-option-modifier nil)
            (setq mac-right-option-modifier 'meta)))

(add-hook 'evil-insert-state-exit-hook
          (lambda ()
            (setq mac-option-modifier 'meta)
            (setq mac-right-option-modifier 'left)))
