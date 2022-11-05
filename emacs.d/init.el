;;;; Bootstrap
;; find our custom nonsense
(add-to-list 'load-path "~/.emacs.d/lisp")
(setq lexical-binding t)

;; Add the repos and initialize everything.
(require 'package)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

;; Make sure use-package is installed, and we'll use that for everything else
(unless (package-installed-p 'use-package)
  (message "%s" "installing use-package...")
  (package-refresh-contents)
  (package-install 'use-package))

;; The rest of this file is general editing config and ui stuff

;; gui stuff
(progn
  (add-to-list 'default-frame-alist '(font . "Input-10"))
  (add-to-list 'default-frame-alist '(height . 56))
  (add-to-list 'default-frame-alist '(width . 125)))

(when (display-graphic-p)
  (tool-bar-mode -1)              ; don't show toolbar
  (scroll-bar-mode -1))          ; don't use scrollbars

;; general UI
(progn
  (column-number-mode t)                  ; show column in mode line
  (line-number-mode t)                    ; show line numbers too
  (menu-bar-mode 1)                       ; show menus
  (show-paren-mode 1)                     ; flash parens
  (ido-mode)                              ; better buffer switching
  (ido-vertical-mode)                     ; prettier
  (setq inhibit-startup-message t         ; no splash screen
        vc-follow-symlinks t              ; don't ask about symlinks
        echo-keystrokes 0.1               ; show in-progress keystrokes
        confirm-kill-emacs 'y-or-n-p      ; don't quit accidentally
        ido-enable-flex-matching t        ; better fuzzy matching
        ns-pop-up-frames nil              ; open new files in existing frame
        frame-title-format "%b"           ; buffer name in title bar
        mouse-yank-at-point t
        visible-bell t
        ido-vertical-define-keys 'C-n-and-C-p-only))

(defalias 'yes-or-no-p 'y-or-n-p)       ; don't make me type "yes"

;; scrolling
(setq scroll-margin 2                                   ; scroll-off
      scroll-conservatively 9999                        ; don't recenter point
      scroll-step 1                                     ; scroll one line at a time
      mouse-wheel-scroll-amount '(2 ((shift) . 1))      ; one line at a time
      mouse-wheel-progressive-speed nil                 ; don't accelerate
      mouse-wheel-follow-mouse 't)                      ; scroll window under mouse

;; backups
(setq backup-by-copying t
      backup-directory-alist '(("." . "~/.emacs.d/backups"))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t
      backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))

;; editing
(setq-default tab-always-indent nil             ; tab actually works like a tab key
              require-final-newline 't          ; unix-friendly trailing newline
              tab-width 2                       ; tabs are two spaces
              indent-tabs-mode nil              ; tab works like a tab key
              sentence-end-double-space nil     ; sentences end with one space
              fill-column 80)                   ; good width for default

(put 'downcase-region 'disabled nil)            ; why is this turned off?

; I can's spell
(setq abbrev-file-name "~/.emacs.d/abbrev_defs"
      save-abbrevs t
      ispell-list-command "--list")

(setq-default abbrev-mode t
              ispell-program-name "aspell")

(require 'mjm/colors)
(require 'mjm/keybindings)
(require 'mjm/filetypes)
(require 'mjm/packages)

(require 'server)
(unless (server-running-p)
  (server-start))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror 'nomessage)
