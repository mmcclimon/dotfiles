(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-auto-local ".auto")
 '(TeX-fold-macro-spec-list
   (quote
    (("{1}"
      ("h"))
     ("[f]"
      ("footnote" "marginpar" "fn"))
     ("[c]"
      ("cite" "nocite" "footcite" "autocite" "autocite*" "cite*"))
     ("[l]"
      ("label"))
     ("[r]"
      ("ref" "pageref" "eqref" "autoref"))
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
      ("tfmo"))
     ("*"
      ("\\star")))))
 '(ansi-term-color-vector
   [unspecified "#FFFFFF" "#d15120" "#5f9411" "#d2ad00" "#6b82a7" "#a66bab" "#6b82a7" "#505050"])
 '(cperl-invalid-face (quote default))
 '(custom-safe-themes
   (quote
    ("3eb2b5607b41ad8a6da75fe04d5f92a46d1b9a95a202e3f5369e2cdefb7aac5c" "5673c365c8679addfb44f3d91d6b880c3266766b605c99f2d9b00745202e75f6" "c1390663960169cd92f58aad44ba3253227d8f715c026438303c09b9fb66cdfb" "7e376fb329a0e46a04e8285b0e45199a083f98c69b0e1039ec1cb1d366e66e9c" "107d4fc77b12ffd38c276d8ab38901d96a2e8c9bb2a780170a919a3e80c97074" "e77a81353dad06d0db1a9351a9475e1177585fd4a0eff4d3c8aa71a18d11a2e2" "ad458d62c0648199289b15bd1d4ad81130361a92f8615e5367e1dff91150095d" "fe1682ca8f7a255cf295e76b0361438a21bb657d8846a05d9904872aa2fb86f2" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "8022cea21aa4daca569aee5c1b875fbb3f3248a5debc6fc8cf5833f2936fbb22" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" default)))
 '(exec-path
   (quote
    ("/usr/bin" "/bin" "/usr/sbin" "/sbin" "/usr/local/Cellar/emacs/24.4/libexec/emacs/24.4/x86_64-apple-darwin14.0.0" "/usr/local/bin" "/Users/michael/bin" "/usr/local/texbin")))
 '(fci-rule-character-color "#d9d9d9")
 '(fci-rule-color "#444444")
 '(inhibit-startup-echo-area-message "michael")
 '(ledger-clear-whole-transactions t)
 '(ledger-highlight-xact-under-point nil)
 '(neo-theme (quote arrow))
 '(org-agenda-files nil)
 '(org-babel-load-languages (quote ((emacs-lisp . t))))
 '(package-selected-packages
   (quote
    (flx-ido ido-vertical-mode grizzl ibuffer-projectile projectile delight markdown-mode wc-mode pandoc-mode simplenote2 web-mode yasnippet auctex magit ledger-mode evil-surround evil-leader evil avy paredit neotree sublime-themes fill-column-indicator)))
 '(projectile-mode-line (quote (:eval (format " ρ[%s]" (projectile-project-name)))))
 '(reftex-bibliography-commands
   (quote
    ("bibliography" "nobibliography" "setupbibtex\\[.*?database=" "addbibresource")))
 '(reftex-label-alist (quote (("example" 120 nil nil nil ("Example")))))
 '(reftex-ref-macro-prompt nil)
 '(simplenote2-markdown-notes-mode (quote markdown-mode))
 '(simplenote2-notes-mode (quote markdown-mode))
 '(simplenote2-show-note-file-name nil)
 '(tree-widget-image-enable nil)
 '(when (not (facep (aref ansi-term-color-vector 0)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(avy-lead-face ((t (:background "goldenrod" :foreground "gray20"))))
 '(avy-lead-face-0 ((t (:background "goldenrod" :foreground "gray20"))))
 '(avy-lead-face-2 ((t (:background "goldenrod1" :foreground "gray12")))))
