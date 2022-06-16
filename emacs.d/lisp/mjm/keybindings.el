(provide 'mjm/keybindings)
(setq lexical-binding t)

;; Mac command bindings
(setq mac-option-modifier 'meta
      mac-command-modifier 'super)

(global-set-key (kbd "s-m") 'iconify-frame)
(global-set-key (kbd "s-q") 'save-buffers-kill-terminal)
(global-set-key (kbd "s-c") 'evil-yank)

;; random stuff I coulb probably delete
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "M-z") 'zap-up-to-char)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(define-key global-map (kbd "RET") 'newline-and-indent)
(define-key global-map (kbd "M-[") 'backward-paragraph)
(define-key global-map (kbd "M-]") 'forward-paragraph)

;; Evil settings
(use-package evil
  :ensure t
  :init
  (progn
    (setq evil-undo-system 'undo-redo))
  :config
  (progn
    (evil-global-set-key 'normal (kbd ",") 'evil-send-leader)
    (evil-global-set-key 'normal (kbd "\\") 'evil-send-localleader)
    (evil-mode 1)))

(use-package evil-surround
  :ensure t
  :config (global-evil-surround-mode 1))

;; colemak stuff
(evil-define-key '(normal visual operator) 'global
  ; mode swaps
  "u" 'evil-insert
  "U" 'evil-insert-line
  ; hjkl => hnei
  "h" 'evil-backward-char
  "n" 'evil-next-line
  "e" 'evil-previous-line
  "i" 'evil-forward-char
  "H" 'evil-top
  "N" 'evil-join
  "E" 'evil-lookup  ; useless
  "I" 'evil-window-bottom
  ; stuff stolen by the above
  "k" 'evil-search-next
  "K" 'evil-search-previous
  "l" 'evil-undo
  "L" 'evil-upcase
  "j" 'evil-forward-word-end
  "J" 'evil-forward-WORD-end)

(evil-define-key 'normal 'global
  ";" 'evil-ex
  ":" 'evil-repeat-find-char
  (kbd "<SPC>") 'evil-ex
  (kbd "<backspace>") 'mode-line-other-buffer
  (kbd "C-t") 'evil-scroll-page-down
  (kbd "C-p") 'projectile-find-file
  (kbd "<leader>b") 'ido-switch-buffer
  (kbd "<leader>f") 'avy-goto-char)

(evil-define-key 'insert 'global
  (kbd "C-a") 'beginning-of-line
  (kbd "C-b") 'backward-char
  (kbd "C-d") 'delete-char
  (kbd "C-e") 'end-of-line
  (kbd "C-f") 'forward-char)

(defmacro mjm/--make-evil-sym (character color)
  `(concat "<" (propertize ,character 'face '((:foreground ,color))) ">"))

(setq evil-mode-line-format '(before . mode-line-frame-identification))
(setq evil-normal-state-tag "<N>"   ; no fancy color for normal mode
      evil-emacs-state-tag (mjm/--make-evil-sym "E" "LightSlateBlue")
      evil-insert-state-tag (mjm/--make-evil-sym "I" "chartreuse4")
      evil-motion-state-tag (mjm/--make-evil-sym "M" "OrangeRed3")
      evil-visual-state-tag (mjm/--make-evil-sym "V" "CadetBlue")
      evil-operator-state-tag (mjm/--make-evil-sym "O" "sienna"))

(setq evil-emacs-state-modes
      (append evil-emacs-state-modes
              '(neotree-mode
                dired-mode
                magit-status-mode)))

(defun mjm/visual-line-mode-keybindings ()
  "Set up visual line mode bindings"
  (when visual-line-mode
    (define-key evil-normal-state-local-map "j" 'evil-next-visual-line)
    (define-key evil-normal-state-local-map "k" 'evil-previous-visual-line)
    (define-key evil-normal-state-local-map "0" 'evil-beginning-of-visual-line)
    (define-key evil-normal-state-local-map "gj" 'evil-next-line)
    (define-key evil-normal-state-local-map "gk" 'evil-previous-line)
    (define-key evil-normal-state-local-map "g0" 'evil-beginning-of-line))
  (unless visual-line-mode
    (define-key evil-normal-state-local-map "j" nil)
    (define-key evil-normal-state-local-map "k" nil)
    (define-key evil-normal-state-local-map "0" nil)
    (define-key evil-normal-state-local-map "gj" nil)
    (define-key evil-normal-state-local-map "gk" nil)
    (define-key evil-normal-state-local-map "g0" nil)))

(add-hook 'visual-line-mode-hook 'mjm/visual-line-mode-keybindings)

(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))

(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
