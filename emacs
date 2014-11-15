;; emacs init file

;;; Packages
;   -----------
(require 'package)
(add-to-list 'package-archives
         '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;;; Interface settings
;   ----------------------------------------------

;; UI packages
(require 'color-theme)
(require 'fill-column-indicator)

; set up modes/variables
(progn
  (load-theme 'misterioso)              ; color theme
  (set-cursor-color "#ffffff")          ; ...with one tiny edit
  (column-number-mode t)                ; show column in mode line
  (menu-bar-mode 1)                     ; show menus (override better-defaults)
  (fci-mode 1)                          ; column ruler
  (ido-mode 'buffers))                  ; better buffer switching

(setq inhibit-startup-message t         ; no splash screen
      fci-rule-column 80                ; rule at column 80
      fci-rule-color "#444444")         ; dark gray column rule

(add-to-list                            ; set default font
 'default-frame-alist
 '(font . "DejaVu Sans Mono-12"))

(if (window-system)                     ; make initial window 120 x 50
    (set-frame-size
     (selected-frame) 120 50))


;;; Text editing
;   ----------------------------------------------

; sane scrolling/whitespace
(setq scroll-margin 2                   ; scroll-off
      scroll-conservatively 9999        ; don't recenter point
      scroll-step 1                     ; scroll one line at a time
      tab-always-indent nil             ; tab actually works like a tab key
      require-final-newline 't)         ; unix-friendly trailing newline

; default vars
(setq-default tab-width 4               ; tabs are four spaces
              indent-tabs-mode nil)     ; tab works like a tab key

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
(evil-mode 1)

(global-set-key (kbd "C-x C-m") 'execute-extended-command)  ; don't use M-x
(define-key global-map (kbd "RET") 'newline-and-indent)     ; ret. also indents


;;; Hooks
;   ----------------------------------------------
(add-hook 'before-save-hook 'whitespace-cleanup)    ; no messy space
(add-hook 'text-mode-hook 'turn-on-auto-fill)       ; wrap text
(add-hook 'after-change-major-mode-hook
          (lambda () (fci-mode 1)))                 ; add column indicator
