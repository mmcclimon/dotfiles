
(require 'package)

(add-to-list 'package-archives
         '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
         '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(defvar required-packages
  '(color-theme
    fill-column-indicator
    base16-theme
    sublime-themes
    neotree
    paredit
    evil
    evil-leader
    evil-surround
    ace-jump-mode
    auctex
    yasnippet
    web-mode))

(defun required-packages-installed-p (packages)
  "Check if all required packages are installed"
  (let ((rest (cdr packages)))
    (if (package-installed-p (car packages))
        (if (eq rest nil) t (required-packages-installed-p rest))
      nil)))

(unless (required-packages-installed-p required-packages)
  (message "%s" "Installing required packages...")
  (package-refresh-contents)
  (dolist (pkg required-packages)
    (when (not (package-installed-p pkg))
      (package-install pkg)))
  (message "%s" "Packages installed"))

(require 'color-theme)
(require 'fill-column-indicator)

(progn
  (load-theme 'base16-default t)        ; color theme
  (column-number-mode t)                ; show column in mode line
  (line-number-mode t)                  ; show line numbers too
  (menu-bar-mode 1)                     ; show menus
  (tool-bar-mode -1)                    ; don't show toolbar
  (scroll-bar-mode -1)                  ; don't use scrollbars
  (show-paren-mode 1)                   ; flash parens
  (fci-mode 1)                          ; column ruler
  (ido-mode))                           ; better buffer switching

(setq inhibit-startup-message t         ; no splash screen
      vc-follow-symlinks t              ; don't ask about symlinks
      echo-keystrokes 0.1               ; show in-progress keystrokes
      ido-enable-flex-matching t        ; better fuzzy matchin
      ns-pop-up-frames nil              ; open new files in existing frame
      frame-title-format "%b")          ; buffer name in title bar

(defalias 'yes-or-no-p 'y-or-n-p)       ; don't make me type "yes"

; patch color theme
(set-face-attribute 'fringe nil :background "#202020")

(setq org-src-fontify-natively t)

(add-to-list
 'default-frame-alist
 '(font . "Input-11"))

(setq scroll-margin 2                                   ; scroll-off
      scroll-conservatively 9999                        ; don't recenter point
      scroll-step 1                                     ; scroll one line at a time
      mouse-wheel-scroll-amount '(2 ((shift) . 1))      ; one line at a time
      mouse-wheel-progressive-speed nil                 ; don't accelerate
      mouse-wheel-follow-mouse 't)                      ; scroll window under mouse

(setq backup-by-copying t
      backup-directory-alist '(("." . "~/.emacs.d/backups"))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(progn
  (autoload 'zap-up-to-char "misc"
    "Kill up to, but not including ARGth occurrence of CHAR." t)
  (require 'uniquify)
  (setq uniquify-buffer-name-style 'forward)
  (require 'saveplace)
  (setq-default save-place t)
  (setq x-select-enable-clipboard t
        x-select-enable-primary t
        mouse-yank-at-point t
        visible-bell t
        ediff-window-setup-function 'ediff-setup-windows-plain
        save-place-file (concat user-emacs-directory "places")
        backup-directory-alist `(("." . ,(concat user-emacs-directory
                                                 "backups")))))

(setq fci-rule-column 80
      fci-rule-color "#444444")

(defun conditionally-turn-on-fci-mode ()
  (if (and
       (> (window-total-width) (+ 4 fci-rule-column))
       (derived-mode-p 'prog-mode))
      (progn
        (fci-mode 1)
        (linum-mode 1))
    (progn
      (fci-mode -1)
      (linum-mode -1))))

(add-hook 'prog-mode-hook (lambda () (fci-mode 1)))     ; always start on
(add-hook 'window-configuration-change-hook 'conditionally-turn-on-fci-mode)
(add-hook 'after-make-frame-functions 'conditionally-turn-on-fci-mode)

(setq-default tab-always-indent nil             ; tab actually works like a tab key
              require-final-newline 't          ; unix-friendly trailing newline
              tab-width 4                       ; tabs are four spaces
              indent-tabs-mode nil              ; tab works like a tab key
              sentence-end-double-space nil     ; sentences end with one space
              fill-column 78)                   ; good width for default

(add-hook 'before-save-hook 'whitespace-cleanup)    ; no messy space
(add-hook 'text-mode-hook 'turn-on-auto-fill)       ; wrap text

(put 'downcase-region 'disabled nil)            ; why is this turned off?

(setq abbrev-file-name "~/.emacs.d/abbrev_defs"
      save-abbrevs t)
(setq-default abbrev-mode t)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "M-z") 'zap-up-to-char)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(define-key global-map (kbd "RET") 'newline-and-indent)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "M-[") 'backward-paragraph)
(define-key global-map (kbd "M-]") 'forward-paragraph)

(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'super)
(global-set-key (kbd "s-m") 'iconify-frame)
(global-set-key (kbd "s-q") 'save-buffers-kill-terminal)
(global-set-key (kbd "s-c") 'evil-yank)

(require 'evil)
(require 'evil-surround)
(require 'evil-leader)
(global-evil-leader-mode 1)
(evil-mode 1)
(global-evil-surround-mode 1)

(define-key evil-normal-state-map ";" 'evil-ex)
(define-key evil-normal-state-map ":" 'evil-repeat-find-char)

(setq evil-emacs-state-modes (append evil-emacs-state-modes
                                     '(neotree-mode
                                       dired-mode
                                       magit-status-mode)))

(define-key evil-insert-state-map (kbd "C-a") 'beginning-of-line)
(define-key evil-insert-state-map (kbd "C-b") 'backward-char)
(define-key evil-insert-state-map (kbd "C-d") 'delete-char)
(define-key evil-insert-state-map (kbd "C-e") 'end-of-line)
(define-key evil-insert-state-map (kbd "C-f") 'forward-char)

(evil-leader/set-leader ",")
(evil-leader/set-key
    "f" 'ace-jump-mode)

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

(defun mjm-ledger-mode-keybindings ()
  "Better keybindings for ledger mode"
  (progn
    (evil-define-key 'normal ledger-mode-map (kbd ",q") 'ledger-post-align-xact)
    (evil-define-key 'normal ledger-mode-map (kbd ",c") 'ledger-toggle-current)
    (evil-define-key 'normal ledger-mode-map (kbd ",p") 'ledger-navigate-prev-xact-or-directive)
    (evil-define-key 'normal ledger-mode-map (kbd ",n") 'ledger-navigate-next-xact-or-directive)))

(add-hook 'ledger-mode-hook 'mjm-ledger-mode-keybindings)

(add-hook 'mail-mode-hook (lambda ()
                            (setq fill-column 72)
                            (turn-on-flyspell)))
(add-to-list 'auto-mode-alist '("\\.eml\\'" . mail-mode))

(add-hook 'markdown-mode-hook
          (lambda ()
            (local-set-key (kbd "RET") 'electric-newline-and-maybe-indent)))

(defalias 'perl-mode 'cperl-mode)
(setq-default cperl-invalid-face 'default
              cperl-indent-parens-as-block t
              cperl-indent-level tab-width)

(setq tex-font-script-display '(-0.0 0.0)
      tex-suscript-height-ratio 1.0)

(require 'reftex)
(setq TeX-auto-save t
      TeX-parse-self t
      reftex-plug-into-AUCTeX t)

(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook (lambda()
                             (turn-on-reftex)
                             (turn-on-flyspell)
                             (TeX-fold-mode 1)))

(defun save-line-num-for-folding ()
"Save current line number and point position so we can compare later.

This sets two buffer-local variables, tex-line-num and prev-point-pos."
  (interactive)
  (unless (window-minibuffer-p)
    (setq-local tex-line-num (line-number-at-pos))
    (setq-local prev-point-pos (point))))

(defun unfold-para-around-point ()
  "Unfolds the paragraph around point and folds up where we just left.

This has to do some additional checking because we really don't want to do this
in the minibuffer or refold/unfold if the point hasn't actually changes lines."
  (interactive)
  (unless (window-minibuffer-p)
    (unless (equal tex-line-num (line-number-at-pos))
      (save-excursion
        (goto-char prev-point-pos)
        (TeX-fold-paragraph))
      (unless (and (bolp) (eolp))
        (TeX-fold-clearout-paragraph)))))

(defun add-tex-folding-hooks ()
  (defvar-local tex-line-num 1 "Local variable to save previous line number.")
  (defvar-local prev-point-pos 1 "Local variable to save previous point-position.")
  (add-hook 'pre-command-hook 'save-line-num-for-folding nil :local)
  (add-hook 'post-command-hook 'unfold-para-around-point nil :local))

(add-hook 'LaTeX-mode-hook 'add-tex-folding-hooks)

(setq web-mode-enable-html-entities-fontification t)

(setq-default ispell-program-name "aspell")
(setq ispell-list-command "--list")

(setq magit-process-connection-type nil
      magit-git-executable "/usr/local/bin/git")
(global-set-key (kbd "C-c G") 'magit-status)

(server-start)

(message nil)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
