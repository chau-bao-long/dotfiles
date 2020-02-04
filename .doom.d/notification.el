(mu4e-alert-set-default-style 'notifier)
(add-hook 'after-init-hook #'mu4e-alert-enable-notifications)
(add-hook 'after-init-hook #'mu4e-alert-enable-mode-line-display)
(add-hook! 'after-init-hook 'org-wild-notifier-mode)

(use-package! org-wild-notifier
  :defer t
  :config
  (setq org-wild-notifier-alert-time 10
        alert-default-style (if IS-MAC 'osx-notifier 'libnotify)))
