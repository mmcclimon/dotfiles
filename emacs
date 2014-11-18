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
  '(better-defaults color-theme fill-column-indicator sublime-themes evil))

(dolist (pkg required-packages)
  (when (not (package-installed-p pkg))
    (package-install pkg)))


;;; Interface settings
;   ----------------------------------------------

;; UI packages
(require 'better-defaults)
(require 'color-theme)
(require 'fill-column-indicator)

; set up modes/variables
(progn
  (load-theme 'brin t)                  ; color theme
  (column-number-mode t)                ; show column in mode line
  (menu-bar-mode 1)                     ; show menus (override better-defaults)
  (fci-mode 1)                          ; column ruler
  (ido-mode 'buffers))                  ; better buffer switching

(setq inhibit-startup-message t         ; no splash screen
      vc-follow-symlinks t              ; don't ask about symlinks
      fci-rule-column 80                ; rule at column 80
      fci-rule-color "#444444")         ; dark gray column rule

(add-to-list                            ; set default font
 'default-frame-alist
 '(font . "DejaVu Sans Mono-11"))

(if (window-system)                     ; make initial window 165 x 50
    (set-frame-size
     (selected-frame) 165 50))


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

; swap colon-semicolon for evil
(define-key evil-normal-state-map ";" 'evil-ex)
(define-key evil-normal-state-map ":" 'evil-repeat-find-char)

;;;; TeX
;   ----------------------------------------------
; turn off terrible subscripting in TeX mode
(setq tex-font-script-display '(-0.0 0.0)
      tex-suscript-height-ratio 1.0)


;;; Hooks
;   ----------------------------------------------
(add-hook 'before-save-hook 'whitespace-cleanup)    ; no messy space
(add-hook 'text-mode-hook 'turn-on-auto-fill)       ; wrap text
(add-hook 'after-change-major-mode-hook
          (lambda () (fci-mode 1)))                 ; add column indicator

(add-hook 'tex-mode-hook (lambda ()
  (custom-set-faces
    '(font-lock-keyword-face ((t (:foreground "#906464"))))
    '(font-lock-constant-face ((t (:foreground "#709070"))))
    '(font-lock-function-name-face ((t (:foreground "#709070"))))
    '(font-lock-builtin--face ((t (:foreground "#a03333"))))
    )))


;; move custom stuff to another file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
