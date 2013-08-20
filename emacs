;; -*- mode: Emacs-Lisp -*-
;;;;.emacs file

;;; Package Management (Marmalade)
(require 'package)
(add-to-list 'package-archives
             '("marmalade" .
               "http://marmalade-repo.org/packages/"))
(package-initialize)
(add-to-list 'load-path "~/.emacs.d")

;;; UI settings
; turn off ugly toolbar and menubar
(tool-bar-mode -1)
(column-number-mode t)
; ido-mode, but not for files
(ido-mode 'buffers)

;; don't have Consolas on my laptop, and don't want to keep sep. files
(if (equal system-name "michael-mint")
    (setq mjm-default-font "DejaVu Sans Mono-10")
  (setq mjm-default-font "Consolas-12"))

; make sure frames created from emacsclient get right color scheme
(defun setup-frame-colors (&rest frame)
  (if window-system
      (let ((f (if (car frame)
                   (car frame)
                 (selected-frame))))
        (progn
          (set-face-attribute 'default nil :font mjm-default-font)
          ;(load-theme 'railscasts t)
          ))))

(require 'server)
(defadvice server-create-window-system-frame
  (after setup-frame-colors ())
  (message "Running after frame-initialize")
  (setup-frame-colors))
(ad-activate 'server-create-window-system-frame)
(add-hook 'after-make-frame-functions 'setup-frame-colors t)

;;; Backups
(setq
   backup-by-copying t
   backup-directory-alist '(("." . "~/.emacs.d/backups"))
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)

;;; General editing (tabs, newline at EOF)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq tab-always-indent nil)
(setq tab-stop-list
      '(4 8 12 16 20 24 28
         32 36 40 44 48 52
         56 60 64 68 72 76
         80 84 88 92 96 100
         104 108 112 116 120))

(setq require-final-newline 't)
(global-linum-mode 1)

;;; Misc. key bindings
; make C-x C-m the same as M-x
(global-set-key (kbd "C-x C-m") 'execute-extended-command)
;;; Rebind `C-x C-b' for buffer-menu
(global-set-key (kbd "C-x C-b") 'buffer-menu)


;;; Evil mode (vim bindings)
(require 'evil)
(evil-mode 1)
(load "~/.emacs.d/evil-settings.el")

;;; Hooks
; clean up whitespace on save
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'twittering-mode-hook
          (lambda () (linum-mode -1)))


;;; Misc. packages


;;; Twitter (why not?)
(defvar twittering-mode-loaded nil
  "Keeps track (for myself) if twittering-mode is loaded or not")

(defun load-twittering-mode ()
  "Load twittering-mode on request"
  (interactive)
  (unless twittering-mode-loaded
    (load "~/.emacs.d/twittering-mode.el")
    (require 'twittering-mode)
    (setq twittering-use-master-password t)
    (setq twittering-icon-mode t)
    (setq twittering-use-icon-storage t)
    (setq twittering-timer-interval (* 60 5))
    (setq twittering-status-format
          "%i %S %FACE[default]{@%s}, %@%R:\n%FILL{  %T%r}\n")
    (setq twittering-mode-loaded t)))


;;;; Keep customize junk in another file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
