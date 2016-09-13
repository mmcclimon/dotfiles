;;;; mto-mode - Emacs mode for typesetting MTO files
;;
;; This is a minor-mode for dealing with MTO typesetting.


;;; Surrounding functions ----------------------------------------------------
;;
;;  These functions all surround something (a line or visual selection) with
;;  some kind of tag.

(defun mto-surround-line-with-p-tags ()
  "Surround a (logical) line with <p> tags."
  (interactive)
  (save-excursion
    (evil-beginning-of-line)
    (insert "<p>")
    (evil-end-of-line)
    (forward-char)
    (insert "</p>")))

(defun mto-subhead ()
  "Surround a line with centered <p> tags."
  (interactive)
  (save-excursion
    (evil-beginning-of-line)
    (insert "<p style=\"text-align:center\"")
    (evil-end-of-line)
    (forward-char)
    (insert "</p>")))

(defun mto--surround-visual-selection (tag-name)
  "Surround a visual selection with a tag name"
  (save-excursion
    (goto-char evil-visual-beginning)
    (insert "<" tag-name ">")
    (goto-char evil-visual-end)
    (insert "</" tag-name ">")))

(defun mto-italicize ()
  "Surround region with <i></i> tags"
  (interactive)
  (mto--surround-visual-selection "i"))

(defun mto-boldify ()
  "Surround region with <b></b> tags"
  (interactive)
  (mto--surround-visual-selection "b"))


;; Citation utilities --------------------------------------------------------

(defvar mto--open nil "String that opens a PHP tag")
(defvar mto--close nil "String that closes a PHP tag")

(defun mto-ask-about-footnotes ()
  "Ask the user whether this is a footnotes file or not, which affects how
footnotes are handled."
  (interactive)
  (let ((is-fn (y-or-n-p "Is this a footnotes file? ")))
    (when is-fn
      ;; in footnotes
      (setq mto--open "\".fn_")
      (setq mto--close ".\""))
    (unless is-fn
      ;; not in footnotes
      (setq mto--open "<?php ")
      (setq mto--close "?>"))))


(defun mto--one-arg-selection (prompt php-func-name &optional prepend-dollar)
  (let* ((selected
          (buffer-substring-no-properties evil-visual-beginning evil-visual-end))
         (var1 (read-from-minibuffer (concat prompt " (" selected "): "))))
    (delete-region evil-visual-beginning evil-visual-end)
    (insert mto--open
            php-func-name
            "("
            (if prepend-dollar "$" "")
            var1
            ")"
            mto--close)
    (evil-exit-visual-state)
    (forward-char)))

(defun mto--two-arg-selection (prompt1 prompt2 php-func-name &optional prepend-dollar)
  "Prompts user twice, inserts a call to php-func-name with arguments that
  correspond to the user input for first prompt (which is inserted without
  quotes) and the second (in double-quotes)."
  ;; TODO fix the hacking around quoting/not-quoting
  (let* ((selected
          (buffer-substring-no-properties evil-visual-beginning evil-visual-end))
         (var1 (read-from-minibuffer
                    (concat prompt1 " (" selected "): ")))
         (var2 (read-from-minibuffer
                    (concat prompt2 " (" selected "): "))))
    (delete-region evil-visual-beginning evil-visual-end)
    (insert mto--open
            php-func-name
            "("
            (if prepend-dollar "$" "")
            var1
            ", \""
            var2
            "\")"
            mto--close)
    (evil-exit-visual-state)
    (forward-char)))

(defun mto--cite-one (php-func-name)
  "For citations with no page number"
  (mto--one-arg-selection "Variable name" php-func-name t))

(defun mto--cite-two (php-func-name)
  (mto--two-arg-selection "Variable name" "Page range" php-func-name t))


;;; Citation functions -------------------------------------------------------
;;
;; These functions insert citations, after prompting user. All of them operate
;; on a visual selection.

(defun mto-cite ()
  "Insert a standard citation: Author Year"
  (interactive)
  (mto--cite-one "cite"))

(defun mto-cite-year ()
  "Cite only a year"
  (interactive)
  (mto--cite-one "cite_year"))

(defun mto-cite-pages ()
  "Insert citation, with pages: Author Year, page"
  (interactive)
  (mto--cite-two "cite_pages"))

(defun mto-cite-year-pages ()
  "Citation, with pages: Year, page"
  (interactive)
  (mto--cite-two "cite_year_pages"))

(defun mto-sharp ()
  "Insert a sharp"
  (interactive)
  (mto--one-arg-selection "Note name" "sharp"))

(defun mto-flat ()
  "Insert a flat"
  (interactive)
  (mto--one-arg-selection "Note name" "flat"))


;;; Miscellaneous user functions ---------------------------------------------

(defun mto-clean-up-tags ()
  "Remove spaces before closing bold or italic tags, and convert all tags
to lowercase"
  (interactive)
  (save-excursion
    (beginning-of-buffer)
    (while (re-search-forward " \\(</[ib]>\\)" nil t)
      (replace-match "\\1 ")))
  (save-excursion
    (beginning-of-buffer)
    (while (re-search-forward "</?[A-Z]+>" nil t)
      (replace-match (downcase (match-string 0)) t nil))))

;;; Keybinding functions ----------------------------------------------------
;;
;; The map functions take a single binding, and the unmap versions take list
;; of bindings.

(defun mto--map-normal (binding func)
  (define-key evil-normal-state-local-map binding func))

(defun mto--unmap-normal (bindings)
  (dolist (key bindings)
    (define-key evil-normal-state-local-map key nil)))

(defun mto--map-visual (binding func)
  (define-key evil-visual-state-local-map binding func))

(defun mto--unmap-visual (bindings)
  (dolist (key bindings)
    (define-key evil-visual-state-local-map key nil)))

;;; Keymaps
(defun mto--modify-keymaps ()
  (when mto-mode
    (mto--map-normal (kbd ",p") 'mto-surround-line-with-p-tags)
    (mto--map-normal (kbd ",s") 'mto-subhead)
    (mto--map-visual (kbd ",i") 'mto-italicize)
    (mto--map-visual (kbd ",b") 'mto-boldify)
    (mto--map-visual (kbd "C-c C-c") 'mto-cite)
    (mto--map-visual (kbd "C-c C-y") 'mto-cite-year)
    (mto--map-visual (kbd "C-c C-p") 'mto-cite-pages)
    (mto--map-visual (kbd "C-c C-o") 'mto-cite-year-pages))   ; "Without" author
  (unless mto-mode
    (mto--unmap-normal '(",p" ",s" ",i" ",b"))
    (mto--unmap-visual '(",i" ",b" "C-c C-c" "C-c C-y" "C-c C-p" "C-c C-o"))))


;;; mto-mode
;;;###autoload
(define-minor-mode mto-mode
  "Minor mode for typesetting MTO files"
  :lighter " mto"
  :keymap (make-sparse-keymap)
  (if mto-mode
      ;; we've just turned it on, so set up everything here
      (progn
        (visual-line-mode 1)
        (mto-ask-about-footnotes))
    ; turning it off -- tear down
    (visual-line-mode -1))
  (mto--modify-keymaps))

(provide 'mto-mode)
