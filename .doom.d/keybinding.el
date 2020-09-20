(define-key evil-normal-state-map "'q" 'evil-save-and-close)
(define-key evil-motion-state-map "z;" 'evil-buffer)
(map! :ne "SPC e" #'execute-extended-command)
(map! :ne "SPC o l" #'list-processes)
(map! :ne "SPC TAB j" #'+workspace:switch-next)
(map! :ne "SPC TAB k" #'+workspace:switch-previous)
(map! :ne "'w" #'save-buffer)
(map! :ne "'q" #'+workspace/close-window-or-workspace)
(map! :ne "SPC 2" #'balance-windows-area)
(defun maximize-window-area() (interactive) (balance-windows-area) (maximize-window))
(map! :ne "SPC 3" #'maximize-window-area)
(map! :ne "SPC w f" #'transpose-frame)
(map! :ne "SPC n r" #'org-toggle-narrow-to-subtree)
