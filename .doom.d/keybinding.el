(define-key evil-normal-state-map "zj" 'evil-scroll-down)
(define-key evil-normal-state-map "zk" 'evil-scroll-up)
(define-key evil-normal-state-map "zo" 'evil-jump-backward)
(define-key evil-normal-state-map "zi" 'evil-jump-forward)
(define-key evil-normal-state-map "'q" 'evil-save-and-close)
(map! :ne "SPC e" #'execute-extended-command)
(map! :ne "SPC o n" #'treemacs-add-and-display-current-project)
(map! :ne "SPC o m" #'mu4e)
(map! :ne "SPC o l" #'list-processes)
(map! :ne "SPC TAB j" #'+workspace:switch-next)
(map! :ne "SPC TAB k" #'+workspace:switch-previous)
(map! :ne "'w" #'save-buffer)
(map! :ne "'q" #'+workspace/close-window-or-workspace)
(map! :ne "SPC 2" #'balance-windows-area)
(defun maximize-window-area() (interactive) (balance-windows-area) (maximize-window))
(map! :ne "SPC 3" #'maximize-window-area)
(map! :ne "SPC w f" #'transpose-frame)
(map! :ne "SPC j c" #'ejc-connect)
(map! :ne "SPC j d" #'ejc-describe-table)
(map! :ne "SPC j l" #'ejc-show-tables-list)
(map! :ne "SPC j q" #'ejc-quit-connection)
(map! :ne "SPC l n" #'org-toggle-narrow-to-subtree)
(map! :ne "SPC k o" #'bongo)
(map! :ne "SPC k b e" #'bongo-erase-buffer)
(map! :ne "SPC k m r" #'bongo-regressive-playback-mode)
(map! :ne "SPC k m p" #'bongo-playlist-mode)
(map! :ve "SPC k p" #'bongo-play-region)
(map! :ne "SPC k l" #'bongo-playlist)
