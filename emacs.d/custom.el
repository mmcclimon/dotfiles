(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-fold-macro-spec-list
   (quote
    (("{1}"
      ("h"))
     ("[f]"
      ("footnote" "marginpar" "fn"))
     ("[c]"
      ("cite"))
     ("[l]"
      ("label"))
     ("[r]"
      ("ref" "pageref" "eqref"))
     ("[i]"
      ("index" "glossary"))
     ("[1]:||*"
      ("item"))
     ("..."
      ("dots"))
     ("(C)"
      ("copyright"))
     ("(R)"
      ("textregistered"))
     ("TM"
      ("texttrademark"))
     (1
      ("part" "chapter" "section" "subsection" "subsubsection" "paragraph" "subparagraph" "part*" "chapter*" "section*" "subsection*" "subsubsection*" "paragraph*" "subparagraph*" "emph" "textit" "textsl" "textmd" "textrm" "textsf" "texttt" "textbf" "textsc" "textup"))
     ("ii-V"
      ("tf"))
     ("ii-V-I"
      ("tfo"))
     ("ii-V-i"
      ("tfmo")))))
 '(custom-safe-themes
   (quote
    ("8022cea21aa4daca569aee5c1b875fbb3f3248a5debc6fc8cf5833f2936fbb22" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" default)))
 '(exec-path
   (quote
    ("/usr/bin" "/bin" "/usr/sbin" "/sbin" "/usr/local/Cellar/emacs/24.4/libexec/emacs/24.4/x86_64-apple-darwin14.0.0" "/usr/local/bin" "/Users/michael/bin" "/usr/local/texbin")))
 '(ledger-clear-whole-transactions t)
 '(ledger-highlight-xact-under-point nil)
 '(neo-theme (quote arrow))
 '(reftex-bibliography-commands
   (quote
    ("bibliography" "nobibliography" "setupbibtex\\[.*?database=" "addbibresource")))
 '(reftex-label-alist (quote (("example" 120 nil nil nil ("Example")))))
 '(reftex-ref-macro-prompt nil)
 '(tree-widget-image-enable nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-fold-folded-face ((t (:foreground "DarkSlateGray4"))))
 '(flyspell-incorrect ((t (:underline (:color "red" :style wave)))))
 '(font-latex-sectioning-5-face ((t (:inherit nil :foreground "firebrick4" :weight bold))))
 '(font-latex-subscript-face ((t nil))))
