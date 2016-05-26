;; keybindings.el
;;
;; Key-binding madness

(progn
  ;; better-defaults bindings
  (global-set-key (kbd "C-x C-b") 'ibuffer)
  (global-set-key (kbd "M-z") 'zap-up-to-char)
  (global-set-key (kbd "C-s") 'isearch-forward-regexp)
  (global-set-key (kbd "C-r") 'isearch-backward-regexp)
  (global-set-key (kbd "C-M-s") 'isearch-forward)
  (global-set-key (kbd "C-M-r") 'isearch-backward)
  ;; misc. global bindings
  (global-set-key (kbd "C-x C-m") 'execute-extended-command)
  (define-key global-map (kbd "RET") 'newline-and-indent)
  (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
  (define-key global-map (kbd "M-[") 'backward-paragraph)
  (define-key global-map (kbd "M-]") 'forward-paragraph)
  (define-key global-map (kbd "C-x r i") 'string-insert-rectangle))

; Mac things
(progn
  (setq mac-option-modifier 'meta)
  (setq mac-command-modifier 'super)
  (global-set-key (kbd "s-m") 'iconify-frame)
  (global-set-key (kbd "s-q") 'save-buffers-kill-terminal)
  (global-set-key (kbd "s-c") 'evil-yank))

(require 'evil)
(require 'evil-surround)
(require 'evil-leader)
(global-evil-leader-mode 1)
(evil-mode 1)
(global-evil-surround-mode 1)
(progn
  (define-key evil-normal-state-map ";" 'evil-ex)
  (define-key evil-normal-state-map ":" 'evil-repeat-find-char)
  (define-key evil-normal-state-map (kbd ",f") 'ace-jump-mode))

; set evil-leader
(evil-leader/set-leader ",")


; don't use evil in modes that remap everything anyway
(setq evil-emacs-state-modes (append evil-emacs-state-modes
                                     '(neotree-mode
                                       dired-mode
                                       magit-status-mode)))

;; fake evil-rsi
(define-key evil-insert-state-map (kbd "C-a") 'beginning-of-line)
; (define-key evil-motion-state-map (kbd "C-a") 'beginning-of-line)
(define-key evil-insert-state-map (kbd "C-b") 'backward-char)
(define-key evil-insert-state-map (kbd "C-d") 'delete-char)
(define-key evil-insert-state-map (kbd "C-e") 'end-of-line)
; (define-key evil-motion-state-map (kbd "C-e") 'end-of-line)
(define-key evil-insert-state-map (kbd "C-f") 'forward-char)
; (define-key evil-insert-state-map (kbd "C-h") 'delete-backward-char)


;; Make escape quit everything
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))

(progn
  (define-key evil-normal-state-map [escape] 'keyboard-quit)
  (define-key evil-visual-state-map [escape] 'keyboard-quit)
  (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit))
