;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Long Chau Bao"
      user-mail-address "chau.bao.long.vn@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "monospace" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
(setq doom-theme 'doom-one)

;; If you intend to use org, it is recommended you change this!
(setq org-directory "~/emacs-org/")

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', where Emacs
;;   looks when you load packages with `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

(define-key evil-normal-state-map "zj" 'evil-scroll-down)
(define-key evil-normal-state-map "zk" 'evil-scroll-up)
(define-key evil-normal-state-map "zo" 'evil-jump-backward)
(define-key evil-normal-state-map "zi" 'evil-jump-forward)
(map! :ne "SPC e" #'execute-extended-command)

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

(after! mu4e
  (setq! mu4e-maildir "~/.Mail/personio"
         mu4e-drafts-folder "/[Gmail]/Drafts"
         mu4e-sent-folder   "/[Gmail]/Sent Mail"
         mu4e-trash-folder  "/[Gmail]/Bin"
         mu4e-get-mail-command "mbsync -a"
         mu4e-index-update-in-background t
         mu4e-compose-signature-auto-include t
         mu4e-use-fancy-chars t
         mu4e-view-show-addresses t
         mu4e-view-show-images t
         mu4e-compose-format-flowed t
         mu4e-change-filenames-when-moving t
         mu4e-update-interval 1800
         mu4e-maildir-shortcuts
         '( ("/INBOX" . ?i)
            ("/[Gmail]/All Mail" . ?a)
            ("/[Gmail]/Important" . ?I)
            ("/[Gmail]/Drafts" . ?d)
            ("/[Gmail]/Starred" . ?S)
            ("/[Gmail]/Bin" . ?b)
            ("/[Gmail]/Sent Mail" . ?s))

         ;; Message Formatting and sending
         message-send-mail-function 'smtpmail-send-it
         message-signature-file "~/.doom.d/.mailsignature"
         message-citation-line-format "On %a %d %b %Y at %R, %f wrote:\n"
         message-citation-line-function 'message-insert-formatted-citation-line
         message-kill-buffer-on-exit t

         ;; Org mu4e
         org-mu4e-convert-to-html t
         ))

(defvar my-mu4e-account-alist
  '(("chaubaolongvn"
     (user-mail-address       "chau.bao.long.vn@gmail.com")
     (user-full-name          "Long Chau Bao")
     (smtpmail-smtp-server    "smtp.gmail.com")
     (smtpmail-smtp-service   587)
     (smtpmail-stream-type    starttls)
     (smtpmail-debug-info     t)
     (mu4e-drafts-folder      "/chaubaolongvn/[Gmail]/Drafts")
     (mu4e-sent-folder        "/chaubaolongvn/[Gmail]/Sent Mail")
     (mu4e-trash-folder       "/chaubaolongvn/[Gmail]/Bin")
     (mu4e-update-interval    1800))
    ("topcbl"
     (user-mail-address       "topcbl@gmail.com")
     (user-full-name          "Long Chau Bao")
     (smtpmail-smtp-server    "smtp.gmail.com")
     (smtpmail-smtp-service   587)
     (smtpmail-stream-type    starttls)
     (smtpmail-debug-info     t)
     (mu4e-drafts-folder      "/topcbl/[Gmail]/Drafts")
     (mu4e-sent-folder        "/topcbl/[Gmail]/Sent Mail")
     (mu4e-trash-folder       "/topcbl/[Gmail]/Bin")
     (mu4e-update-interval    1800))
    ("personio"
     (user-mail-address       "long.chau.ext@personio.de")
     (user-full-name          "Long Chau Bao")
     (smtpmail-smtp-server    "smtp.gmail.com")
     (smtpmail-smtp-service   587)
     (smtpmail-stream-type    starttls)
     (smtpmail-debug-info     t)
     (mu4e-drafts-folder      "/personio/[Gmail]/Drafts")
     (mu4e-sent-folder        "/personio/[Gmail]/Sent Mail")
     (mu4e-trash-folder       "/personio/[Gmail]/Bin")
     (mu4e-update-interval    1800))
    ("fram"
     (user-mail-address       "long.chau@wearefram.com")
     (user-full-name          "Long Chau Bao")
     (smtpmail-smtp-server    "smtp.gmail.com")
     (smtpmail-smtp-service   587)
     (smtpmail-stream-type    starttls)
     (smtpmail-debug-info     t)
     (mu4e-drafts-folder      "/fram/[Gmail]/Drafts")
     (mu4e-sent-folder        "/fram/[Gmail]/Sent Mail")
     (mu4e-trash-folder       "/fram/[Gmail]/Bin")
     (mu4e-update-interval    1800))))

(defun my-mu4e-set-account ()
  "Set the account for composing a message."
  (let* ((account
          (if mu4e-compose-parent-message
              (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
                (string-match "/\\(.*?\\)/" maildir)
                (match-string 1 maildir))
            (completing-read (format "Compose with account: (%s) "
                                     (mapconcat #'(lambda (var) (car var))
                                                my-mu4e-account-alist "/"))
                             (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
                             nil t nil nil (caar my-mu4e-account-alist))))
         (account-vars (cdr (assoc account my-mu4e-account-alist))))
    (if account-vars
        (mapc #'(lambda (var)
                  (set (car var) (cadr var)))
              account-vars)
      (error "No email account found"))))

;; ask for account when composing mail
(add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)
