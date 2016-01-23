;; ui.el
;;
;; Settings for Emacs user interface

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
      frame-title-format "%b"           ; buffer name in title bar
      fci-rule-column 80                ; rule at column 80
      fci-rule-color "#444444")         ; dark gray column rule


; sane scrolling
(setq scroll-margin 2                                   ; scroll-off
      scroll-conservatively 9999                        ; don't recenter point
      scroll-step 1                                     ; scroll one line at a time
      mouse-wheel-scroll-amount '(2 ((shift) . 1))      ; one line at a time
      mouse-wheel-progressive-speed nil                 ; don't accelerate
      mouse-wheel-follow-mouse 't)                      ; scroll window under mouse


(defalias 'yes-or-no-p 'y-or-n-p)       ; don't make me type "yes"

(add-to-list                            ; set default font
 'default-frame-alist
 '(font . "Input-11"))

; patch color theme
(set-face-attribute 'fringe nil :background "#202020")

; backup settings
(setq backup-by-copying t
      backup-directory-alist '(("." . "~/.emacs.d/backups"))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;; stuff from better-defaults, without the annoying bits
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


;; fci-mode fiddling
;;
;; fci-mode is nice, but is annoying if the window is too small, since it adds
;; long-line indicators on every line. It's also much more useful in
;; prog-modes than it is in text modes, so here we have a bit of lisp to
;; figure out where it's most useful, and turns it on/off accordingly.
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
