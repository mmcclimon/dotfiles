;; filetypes.el
;;
;; Miscellaneous settings for various file types

;; TeX
;; ----------

(setq tex-font-script-display '(-0.0 0.0)
      tex-suscript-height-ratio 1.0)

;; auctex/reftex
(require 'reftex)
(setq TeX-auto-save t
      TeX-parse-self t
      reftex-plug-into-AUCTeX t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook (lambda()
                             (turn-on-reftex)
                             (turn-on-flyspell)
                             (TeX-fold-mode 1)))

;; mail
(add-hook 'mail-mode-hook (lambda ()
                            (setq fill-column 72)
                            (turn-on-flyspell)))
(add-to-list 'auto-mode-alist '("\\.eml\\'" . mail-mode))

;; web-mode
(setq web-mode-enable-html-entities-fontification t)

;; Perl
(defalias 'perl-mode 'cperl-mode)
(setq-default cperl-invalid-face 'default
              cperl-indent-parens-as-block t
              cperl-indent-level tab-width)


;; ledger mode
;; ----------

(defun mjm-ledger-mode-keybindings ()
  "Better keybindings for ledger mode"
  (progn
    (evil-define-key 'normal ledger-mode-map (kbd ",q") 'ledger-post-align-xact)
    (evil-define-key 'normal ledger-mode-map (kbd ",c") 'ledger-toggle-current)
    (evil-define-key 'normal ledger-mode-map (kbd ",p") 'ledger-navigate-prev-xact-or-directive)
    (evil-define-key 'normal ledger-mode-map (kbd ",p") 'ledger-navigate-next-xact-or-directive)))

(add-hook 'ledger-mode-hook 'mjm-ledger-mode-keybindings)
