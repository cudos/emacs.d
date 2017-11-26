;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; gtd.el
;;
;; org-mode configuration for my personal GTD workflow
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'gtd)


;; Add all org-mode GTD files to agenda
(setq org-agenda-files '("~/gtd/gtd.org"))
		      

;; Setup capture templates
(setq org-capture-templates '(("t" "Todo [inbox]" entry
                               (file+headline "~/gtd/gtd.org" "Tasks")
                               "* TODO %i%?")))


;; Set up capture keybinding C-c c
(define-key global-map "\C-cc" 'org-capture)


;; Set up refile targets
(setq org-refile-targets '(("~/gtd/gtd.org" :maxlevel . 3)
                           ("~/gtd/someday.org" :level . 1)))


;; Set todo keywords
(setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))

