
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

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
