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
               mu4e-update-interval 300
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

(require 'mu4e)
(setq mu4e-contexts
      `( ,(make-mu4e-context
           :name "Global"
           :enter-func (lambda () (mu4e-message "Entering Global context"))
           :leave-func (lambda () (mu4e-message "Leaving Global context"))
           :match-func (lambda (msg)
                         (when msg
                           (string-match-p "^/chaubaolongvn" (mu4e-message-field msg :maildir))))
           :vars '( ( user-mail-address . "chau.bao.long.vn@gmail.com"  )
                    ( mu4e-get-mail-command . "mbsync -a" )
                    ( mu4e-update-interval . 60 )
                    ( user-full-name . "Long Chau Bao" )))
         ,(make-mu4e-context
           :name "Work"
           :enter-func (lambda () (mu4e-message "Switch to the Work context"))
           :match-func (lambda (msg)
                         (when msg
                           (string-match-p "^/fram" (mu4e-message-field msg :maildir))))
           :vars '( ( user-mail-address . "long.chau.ext@personio.de" )
                    ( user-full-name . "Long Chau Bao" )
                    ( mu4e-update-interval . 300 )
                    ( mu4e-get-mail-command . "mbsync personio" )
                    ))
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
