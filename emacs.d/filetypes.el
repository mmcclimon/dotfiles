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
(add-hook 'mail-mode-hook (lambda () (setq fill-column 72)))
(add-to-list 'auto-mode-alist '("\\.eml\\'" . mail-mode))
