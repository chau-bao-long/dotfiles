(def-package! org-super-agenda
    :after org-agenda
    :init 
    (setq org-super-agenda-groups '((:name "Today"
                                  :time-grid t
                                  :scheduled today)
                           (:name "Due today"
                                  :deadline today)
                           (:name "Important"
                                  :priority "A")
                           (:name "Overdue"
                                  :deadline past)
                           (:name "Due soon"
                                  :deadline future)
                           (:name "Big Outcomes"
                                  :tag "bo")))
    :config
    (org-super-agenda-mode)
)

;; use org-bullets-mode for utf8 symbols as org bullets
(require 'org-bullets)
;; make available "org-bullet-face" such that I can control the font size individually
(setq org-bullets-face-name (quote org-bullet-face))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-bullets-bullet-list '("" "" "" "" "" "" "" "" "" ""))

(custom-set-faces
  '(org-level-1 ((t (:font "Hack" :height 1.1 :foreground "#ff79c6"))))
  '(org-level-2 ((t (:font "Hack" :height 1.0 :foreground "#f1fa8c"))))
  '(org-level-3 ((t (:font "Hack" :height 1.0 :foreground "#50fa7b"))))
  '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
  '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
)
