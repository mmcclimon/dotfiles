;; mjm-packages.el
;;
;; Package management code lives here

(require 'package)

(add-to-list 'package-archives
         '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
         '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

;; install missing packages
(defvar required-packages
  '(color-theme fill-column-indicator base16-theme sublime-themes evil
    auctex yasnippet evil-surround web-mode ace-jump-mode neotree paredit
    clojure-mode clojure-mode-extra-font-locking cider rainbow-delimiters
    evil-leader))

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
