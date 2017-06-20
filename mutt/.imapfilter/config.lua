function main()
    server = "outlook.office365.com"
    user = "marc.coury@accesso.com"
    pass = io.popen('~/.imapfilter/get_password.py -a ' .. user .. ' -s ' .. server)
    res = pass:read("*a")
    res = string.gsub(res, "\n", "")

    local account = IMAP {
        server = server,
        username = user,
        password = res
    }

    -- Get all mail from INBOX
    mails = account.INBOX:select_all()

    -- Move emails
    filter_emails(account, mails)

end

function filter_emails(account, mails)
    -- Delete emails from Sentry
    delete_mail_from(account, mails, "noreply@md.getsentry.com")

    -- Delete emails from Cron Daemon
    delete_mail_from(account, mails, "Cron Daemon")

    -- Delete emails from Datadog
    delete_mail_from(account, mails, "alert@datadoghq.com")
    delete_mail_from(account, mails, "no-reply@datadoghq.com")

    -- Delete emails from opbeat
    delete_mail_from(account, mails, "support@opbeat.com")

    -- Delete emails from FB workplace
    delete_mail_from(account, mails, "notification+kjdvdhhvp8-m@fbworkmail.com")
    delete_mail_from(account, mails, "notification+kjdvdhhvp7-m@fbworkmail.com")
    delete_mail_from(account, mails, "accesso via Workplace")

    -- Delete Spam
    delete_mail_from(account, mails, "oqjupjq@hostepro.co.ua")

    -- Move hlin emails to hlin mailbox
    move_if_to_contains(account, mails, "hlin@noreply.github.com", "Hlin")

    -- Move Gurjinder emails to gurjinder mailbox
    move_if_to_contains(account, mails, "gurjinder.massan@gmail.com", "Gurjinder")

    -- Move Sales reports to Sales Reports folder
    move_if_subject_contains(account, mails, "Sales attached", "Sales Reports")

end

function move_if_subject_contains(account, mails, subject, mailbox)
    filtered = mails:contain_subject(subject)
    filtered:move_messages(account[mailbox]);
end

function move_if_to_contains(account, mails, to, mailbox)
    filtered = mails:contain_to(to)
    filtered:move_messages(account[mailbox]);
end

function move_if_from_contains(account, mails, from, mailbox)
    filtered = mails:contain_from(from)
    filtered:move_messages(account[mailbox]);
end

function delete_mail_from(account, mails, from)
    filtered = mails:contain_from(from)
    filtered:delete_messages()
end

function delete_mail_if_subject_contains(account, mails, subject)
    filtered = mails:contain_subject(subject)
    filtered:delete_messages()
end

main() -- Call the main function
