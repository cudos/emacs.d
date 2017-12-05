;; tools.el

(provide 'tools)


;; Helm
(require 'helm-config)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-x r l") #'helm-bookmarks)
(helm-mode 1)


;; Projectile
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)


;; Enable latex preview mode on latex files
(latex-preview-pane-enable)


;; Helm fuzzz matching everywhere
(defvar helm-M-x-fuzzy-match t)
(defvar helm-ff-fuzzy-matching t)
(defvar helm-apropos-fuzzy-match t)
(defvar helm-buffers-fuzzy-matching t)
(defvar helm-locate-fuzzy-match nil)
(defvar helm-mode-fuzzy-match t)
(defvar helm-completion-in-region-fuzzy-match t)
