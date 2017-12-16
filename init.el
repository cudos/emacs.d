;; .emacs.d/init.el - the entry point to my emacs config

;; Turn off menu bar/tool bar scroll bar early
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Start fullscreen
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Install packages
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
	     '("marmalade" .
	       "https://marmalade-repo.org/packages/"))

(package-initialize)

(setq package-selected-packages
      '(
	markdown-preview-mode
	latex-preview-pane
	company-terraform
	solarized-theme
	magit
	clojure-mode
	cider
	paredit
	auto-complete
	markdown-mode
	helm
	projectile
	helm-projectile
	latex-preview-pane
	solarized-theme
	))

(defun install-packages ()
  "Install all required packages."
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package package-selected-packages)
    (unless (package-installed-p package)
      (package-install package))))

(install-packages)

;; Remove trailing whitespaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Display matching parenthesis
(require 'paren)
(setq show-paren-style 'parenthesis)
(show-paren-mode +1)

;; Display time
(display-time-mode 1)

;; Set path to dependencies
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path settings-dir)
(add-to-list 'load-path site-lisp-dir)

;; Set up keybindins early
(require 'keybindings)

;; Set up appearance early
(require 'appearance)

;; Set up clojure settings
(require 'clojure)

;; Set up org-mode settings
(require 'gtd)

;; Set up my tools
(require 'tools)

;; Add external projects to load path
(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
		 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))
