(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-fold-macro-spec-list (quote (("{1}" ("h")) ("[f]" ("footnote" "marginpar" "fn")) ("[c]" ("cite")) ("[l]" ("label")) ("[r]" ("ref" "pageref" "eqref")) ("[i]" ("index" "glossary")) ("[1]:||*" ("item")) ("..." ("dots")) ("(C)" ("copyright")) ("(R)" ("textregistered")) ("TM" ("texttrademark")) (1 ("part" "chapter" "section" "subsection" "subsubsection" "paragraph" "subparagraph" "part*" "chapter*" "section*" "subsection*" "subsubsection*" "paragraph*" "subparagraph*" "emph" "textit" "textsl" "textmd" "textrm" "textsf" "texttt" "textbf" "textsc" "textup")) ("ii-V" ("tf")) ("ii-V-I" ("tfo")) ("ii-V-i" ("tfmo")))))
 '(custom-safe-themes (quote ("8022cea21aa4daca569aee5c1b875fbb3f3248a5debc6fc8cf5833f2936fbb22" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" default)))
 '(exec-path (quote ("/usr/bin" "/bin" "/usr/sbin" "/sbin" "/usr/local/Cellar/emacs/24.4/libexec/emacs/24.4/x86_64-apple-darwin14.0.0" "/usr/local/bin" "/Users/michael/bin" "/usr/local/texbin")))
 '(ledger-clear-whole-transactions t)
 '(ledger-highlight-xact-under-point nil)
 '(neo-theme (quote arrow))
 '(reftex-bibliography-commands (quote ("bibliography" "nobibliography" "setupbibtex\\[.*?database=" "addbibresource")))
 '(reftex-label-alist (quote (("example" 120 nil nil nil ("Example")))))
 '(reftex-ref-macro-prompt nil)
 '(tree-widget-image-enable nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-fold-folded-face ((t (:foreground "DarkSlateGray4"))))
 '(flyspell-duplicate ((t (:underline (:color "chartreuse4" :style wave)))))
 '(flyspell-incorrect ((t (:underline (:color "red" :style wave)))))
 '(font-latex-sectioning-5-face ((t (:inherit term-color-red :weight bold))))
 '(font-latex-string-face ((t (:inherit font-lock-doc-string-face))))
 '(font-latex-subscript-face ((t nil)))
 '(font-lock-comment-face ((t (:foreground "#707070"))))
 '(ledger-font-auto-xact-face ((t (:inherit font-lock-type-face :weight normal))))
 '(ledger-font-payee-cleared-face ((t (:inherit ledger-font-posting-date-face))))
 '(ledger-font-payee-uncleared-face ((t (:inherit font-lock-warning-face :weight bold))))
 '(ledger-font-pending-face ((t (:inherit ledger-font-payee-uncleared-face :weight bold))))
 '(ledger-font-posting-account-face ((t (:inherit font-lock-function-name-face))))
 '(ledger-font-posting-amount-face ((t (:inherit font-lock-keyword-face))))
 '(ledger-font-posting-date-face ((t (:inherit font-lock-constant-face))))
 '(ledger-occur-xact-face ((t nil)))
 '(link ((t (:inherit term-color-blue :underline t))))
 '(link-visited ((t (:inherit term-color-purple :underline t))))
 '(mode-line ((t (:background "#505050" :foreground "#e0e0e0"))))
 '(mode-line-inactive ((t (:inherit mode-line :background "gray20" :foreground "gray50" :weight light)))))
