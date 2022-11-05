(provide 'mjm/filetypes)
(setq lexical-binding t)

;; text mode
; (add-hook 'before-save-hook 'whitespace-cleanup)  ; no messy space
(add-hook 'text-mode-hook 'turn-on-auto-fill)       ; wrap text

;; general prog-mode stuff
(defun mjm/auto-fill-comments ()
  (setq-local comment-auto-fill-only-comments t)
  (auto-fill-mode 1))

(add-hook 'prog-mode-hook 'mjm/auto-fill-comments)

(defun mjm/maybe-enable-fci ()
  (if (and
       (> (window-total-width) (+ 4 fill-column))
       (derived-mode-p 'prog-mode))
      (display-fill-column-indicator-mode 1)
    (display-fill-column-indicator-mode -1)))

; (add-hook 'window-configuration-change-hook 'mjm/maybe-enable-fci)
; (add-hook 'after-make-frame-functions 'mjm/maybe-enable-fci)


;; ledger mode
(defun mjm/ledger-mode-keybindings ()
  "Better keybindings for ledger mode"
  (progn
    (evil-define-key 'normal ledger-mode-map (kbd ",q") 'ledger-post-align-xact)
    (evil-define-key 'normal ledger-mode-map (kbd ",c") 'ledger-toggle-current)
    (evil-define-key 'normal ledger-mode-map (kbd ",p") 'ledger-navigate-prev-xact-or-directive)
    (evil-define-key 'normal ledger-mode-map (kbd ",n") 'ledger-navigate-next-xact-or-directive)))

(use-package ledger-mode
  :ensure t
  :defer t
  :hook (ledger-mode . mjm/ledger-mode-keybindings))

;; mail mode
(defun mjm/mail-mode-hook ()
  (setq fill-column 72)
  (turn-on-flyspell))

(add-hook 'mail-mode-hook 'mjm/mail-mode-hook)
(add-to-list 'auto-mode-alist '("\\.eml\\'" . mail-mode))

;; markdown
(defun mjm/markdown-mode-hook ()
  (local-set-key (kbd "RET") 'electric-newline-and-maybe-indent))

(add-hook 'markdown-mode-hook 'mjm/markdown-mode-hook)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode)
                              '("\\.mkdn\\'" . markdown-mode))

;; org mode
(defun mjm/org-mode-hook ()
  (setq org-src-fontify-natively t)
  (evil-define-key 'normal org-mode-map (kbd ",n") 'outline-next-visible-heading)
  (evil-define-key 'normal org-mode-map (kbd ",p") 'outline-previous-visible-heading)
  (evil-define-key 'normal org-mode-map (kbd ",u") 'outline-up-heading)
  (evil-define-key 'normal org-mode-map (kbd ",c") 'org-ctrl-c-ctrl-c))

(add-hook 'org-mode-hook 'mjm/org-mode-hook)

;; perl
(defalias 'perl-mode 'cperl-mode)

(defun mjm/perl-mode-hook ()
  (turn-on-auto-fill)
  (abbrev-mode -1)
  (setq-default cperl-invalid-face 'default
                cperl-indent-parens-as-block t
                cperl-indent-level 2
                cperl-indent-subs-specially nil)
  (setq fill-column 72
        ;; stolen from genehack
        cperl-autoindent-on-semi t
        cperl-auto-newline nil
        cperl-clobber-lisp-bindings t
        cperl-close-paren-offset -2
        cperl-continued-statement-offset 2
        cperl-electric-keywords t
        cperl-electric-lbrace-space nil
        cperl-electric-linefeed t
        cperl-electric-parens nil
        cperl-font-lock t
        cperl-highlight-variables-indiscriminately t
        cperl-indent-level 2
        cperl-indent-parens-as-block t
        cperl-indent-region-fix-constructs nil
        cperl-info-on-command-no-prompt t
        cperl-invalid-face nil
        cperl-lazy-help-time 5
        cperl-tab-always-indent t))

(add-hook 'cperl-mode-hook 'mjm/perl-mode-hook)

;; web mode
(use-package web-mode
  :ensure t
  :defer t
  :config
  (setq web-mode-enable-html-entities-fontification t))

;; mto-mode, which is web-mode's buddy
(autoload 'mto-mode "mto-mode" "Minor mode for MTO typesetting" t)
