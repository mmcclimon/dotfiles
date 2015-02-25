;; text-editing.el
;;
;; Misc. settings for formatting text

(setq-default tab-always-indent nil             ; tab actually works like a tab key
              require-final-newline 't          ; unix-friendly trailing newline
              tab-width 4                       ; tabs are four spaces
              indent-tabs-mode nil              ; tab works like a tab key
              sentence-end-double-space nil     ; sentences end with one space
              fill-column 78)                   ; good width for default

(add-hook 'before-save-hook 'whitespace-cleanup)    ; no messy space
(add-hook 'text-mode-hook 'turn-on-auto-fill)       ; wrap text
