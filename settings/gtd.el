;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; gtd.el
;;
;; org-mode configuration for my personal GTD workflow
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'gtd)

;; Add all org-mode GTD files to agenda
(setq org-agenda-files '("~/org/"))


;; Set default notes file
(setq org-default-notes-file "~/org/refile.org")


;; Set up refile targets
(setq org-refile-targets '(
			   ("~/org/work.org" :maxlevel . 3)
			   ("~/org/tech.org" :maxlevel . 3)
			   ("~/org/finance.org" :maxlevel . 3)
			   ("~/org/other.org" :maxlevel . 3)
                           ("~/org/someday.org" :level . 1)))

;; Setup capture templates
(setq org-capture-templates (quote
       (("t" "todo" entry (file+headline "~/org/refile.org" "Tasks")
	 "* TODO %i%?\n\n\n" :prepend t))))


;; Set TODO keywords
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAITING(w)" "NEXT(n)" "|" "DONE(d)" "CANCELLED(c)")))


;; fontify code in code blocks
(setq org-src-fontify-natively t)


;; Set up capture keybinding C-c c
(define-key global-map "\C-cc" 'org-capture)


;; Add keybinding for org-agenda
(global-set-key "\C-ca" 'org-agenda)


;; Some agenda custom commands
(setq org-agenda-custom-commands
      '(("w" todo "WAITING" nil)
	("n" todo "NEXT" nil)
	("d" "Agenda + Next Actions" ((agenda) (todo "NEXT")))))


;; Log when a a certain TODO item was finished
(setq org-log-done 'time)
