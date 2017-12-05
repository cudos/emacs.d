;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; gtd.el
;;
;; org-mode configuration for my personal GTD workflow
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'gtd)


;; Add all org-mode GTD files to agenda
(setq org-agenda-files '("~/Dropbox/org/"))


(setq org-default-notes-file "~/Dropbox/org/refile.org")


;; Set up refile targets
(setq org-refile-targets '(("~/Dropbox/org/gtd.org" :maxlevel . 3)
                           ("~/Dropbox/org/someday.org" :level . 1)))


;; Setup capture templates
(setq org-capture-templates (quote 
       (("t" "todo" entry (file+headline "~/Dropbox/org/refile.org" "Tasks")
	 "* TODO %i%?\n\n\n" :prepend t)
       ("n" "note" entry (file+headline "~/Dropbox/org/refile.org" "Notes")
	 "* %? :NOTE:\n" :prepend t))))


;; Set todo keywords
(setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))


;; fontify code in code blocks
(setq org-src-fontify-natively t)


;; Set up capture keybinding C-c c
(define-key global-map "\C-cc" 'org-capture)


;; Add keybinding for org-agenda
(global-set-key "\C-ca" 'org-agenda)
