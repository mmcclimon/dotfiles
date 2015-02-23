;; emacs init file

;;; Packages
;   -----------
(require 'package)
(add-to-list 'package-archives
         '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
         '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

;; install missing packages
(defvar required-packages
  '(better-defaults color-theme fill-column-indicator sublime-themes evil
    auctex yasnippet evil-surround web-mode ace-jump-mode neotree paredit
    clojure-mode clojure-mode-extra-font-locking cider rainbow-delimiters))

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


;;; Interface settings
;   ----------------------------------------------

;; UI packages
(require 'better-defaults)
(require 'color-theme)
(require 'fill-column-indicator)

; set up modes/variables
(progn
  (load-theme 'hickey t)                ; color theme
  (column-number-mode t)                ; show column in mode line
  (line-number-mode t)                  ; show line numbers too
  (menu-bar-mode 1)                     ; show menus (override better-defaults)
  (fci-mode 1)                          ; column ruler
  (ido-mode 'buffers))                  ; better buffer switching

(setq inhibit-startup-message t         ; no splash screen
      vc-follow-symlinks t              ; don't ask about symlinks
      echo-keystrokes 0.1               ; show in-progress keystrokes
      fci-rule-column 80                ; rule at column 80
      fci-rule-color "#444444")         ; dark gray column rule

(defalias 'yes-or-no-p 'y-or-n-p)       ; don't make me type "yes"

(add-to-list                            ; set default font
 'default-frame-alist
 '(font . "DejaVu Sans Mono-11"))


;;; Text editing
;   ----------------------------------------------

; sane scrolling/whitespace
(setq scroll-margin 2                   ; scroll-off
      scroll-conservatively 9999        ; don't recenter point
      scroll-step 1                     ; scroll one line at a time
      tab-always-indent nil             ; tab actually works like a tab key
      require-final-newline 't)         ; unix-friendly trailing newline

; mouse scrollling
(setq mouse-wheel-scroll-amount '(2 ((shift) . 1))      ; one line at a time
      mouse-wheel-progressive-speed nil                 ; don't accelerate
      mouse-wheel-follow-mouse 't)                      ; scroll window under mouse


; default vars
(setq-default tab-width 4                       ; tabs are four spaces
              indent-tabs-mode nil              ; tab works like a tab key
              sentence-end-double-space nil     ; sentences end with one space
              fill-column 78)                   ; good width for default

; backups
(setq backup-by-copying t
      backup-directory-alist '(("." . "~/.emacs.d/backups"))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;;; Key bindings
;   ----------------------------------------------
(require 'evil)                         ; vim bindings
(require 'evil-surround)

(global-set-key (kbd "C-x C-m") 'execute-extended-command)  ; don't use M-x
(define-key global-map (kbd "RET") 'newline-and-indent)     ; ret. also indents

; swap colon-semicolon for evil
(define-key evil-normal-state-map ";" 'evil-ex)
(define-key evil-normal-state-map ":" 'evil-repeat-find-char)

(define-key evil-normal-state-map ",b" 'ido-switch-buffer)
(define-key evil-normal-state-map (kbd ",f") 'ace-jump-mode)

;;; non-evil bindings
;   ----------------------------------------------
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "M-[") 'backward-paragraph)
(define-key global-map (kbd "M-]") 'forward-paragraph)
(define-key global-map (kbd "C-x r i") 'string-insert-rectangle)

;;;; TeX
;   ----------------------------------------------
; turn off terrible subscripting in TeX mode
(setq tex-font-script-display '(-0.0 0.0)
      tex-suscript-height-ratio 1.0)

; auctex/reftex
(require 'reftex)
(setq TeX-auto-save t
      TeX-parse-self t
      reftex-plug-into-AUCTeX t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook (lambda()
                             (turn-on-reftex)
                             (turn-on-flyspell)
                             (TeX-fold-mode 1)))

(setq-default ispell-program-name "aspell")
(setq ispell-list-command "--list")

; make sure tex binaries get into PATH
(setenv "PATH"
        (concat "/usr/texbin" ":" "~/bin" ":" "/usr/local/bin" ":"
                (getenv "PATH")))

;;; Magit
;   ----------------------------------------------
(setq magit-process-connection-type nil
      magit-git-executable "/usr/local/bin/git")
(global-set-key (kbd "C-c G") 'magit-status)

;;; Hooks
;   ----------------------------------------------
(add-hook 'before-save-hook 'whitespace-cleanup)    ; no messy space
(add-hook 'text-mode-hook 'turn-on-auto-fill)       ; wrap text
(add-hook 'prog-mode-hook
          (lambda () (fci-mode 1)))                 ; add column indicator
(add-hook 'mail-mode-hook
          (lambda () (setq fill-column 72)))

;; only turn on 80-column rule if the window is wider than 80 chars, to avoid
;; long-line indicators
(defun conditionally-turn-on-fci-mode ()
  (if (and
       (> (window-total-width) (+ 4 fci-rule-column))
       (derived-mode-p 'prog-mode))
      (fci-mode 1)
    (fci-mode -1)))

(add-hook 'window-configuration-change-hook 'conditionally-turn-on-fci-mode)
(add-hook 'after-make-frame-functions 'conditionally-turn-on-fci-mode)


;;; Filetypes
(add-to-list 'auto-mode-alist
             '("\\.eml\\'" . mail-mode))

;;; Server
(server-start)

;; move custom stuff to another file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; Local Variables:
;; mode: emacs-lisp
;; End:
