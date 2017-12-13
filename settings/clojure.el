(provide 'clojure)

(show-paren-mode 1)
(setq show-paren-delay 0)

(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojurescript-mode-hook 'paredit-mode)
(setq cider-repl-pop-to-buffer-on-connect nil)
