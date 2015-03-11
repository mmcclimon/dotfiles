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

(require 'evil)
(require 'evil-surround)
(evil-mode 1)
(progn
  (define-key evil-normal-state-map ";" 'evil-ex)
  (define-key evil-normal-state-map ":" 'evil-repeat-find-char)
  (define-key evil-normal-state-map (kbd ",f") 'ace-jump-mode))