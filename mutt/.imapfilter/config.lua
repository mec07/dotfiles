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

    -- Move emails
    filter_emails(account)

end

function filter_emails(account)
    print("entered filer_emails")
    -- Delete emails from Sentry
    delete_mail_from(account, "noreply@md.getsentry.com")

    -- Delete emails from Cron Daemon and alerts
    delete_mail_from(account, "Cron Daemon")
    delete_mail_from(account, "webadmin@ovaltine.ingresso.co.uk")
    delete_mail_from(account, "webadmin@dogbert.london-internal.ingresso.co.uk")
    delete_mail_from(account, "ws-pure-dogbert@ingresso.co.uk")
    delete_mail_from(account, "webadmin@the-angel-islington")
    delete_mail_from(account, "webadmin@clementine")
    delete_mail_if_subject_contains(account, "ALERT (INTERNAL)")
    delete_mail_if_subject_contains(account, "Re: ALERT (INTERNAL)")
    delete_mail_if_subject_contains(account, "dogbert.london-internal.ingresso.co.uk")
    delete_mail_if_subject_contains(account, "async_perf_check-log")
    delete_mail_if_subject_contains(account, "Cron")
    delete_mail_to(account, "netadmin@core.ingresso.co.uk")
    delete_mail_to(account, "netadmin@constantine.ingresso.co.uk")
    delete_mail_to(account, "webadmin@core.ingresso.co.uk")
    delete_mail_to(account, "webadmin@dogbert.ingresso.co.uk")
    delete_mail_to(account, "webadmin@constantine.ingresso.co.uk")

    -- Delete emails from Datadog
    delete_mail_from(account, "alert@datadoghq.com")
    delete_mail_from(account, "no-reply@datadoghq.com")
    delete_mail_from(account, "no-reply@dtdg.co")
    delete_mail_from(account, "alert@dtdg.co")
    delete_mail_from(account, "Datadog Alerting <alert@dtdg.co>")

    -- Delete emails from opbeat
    delete_mail_from(account, "support@opbeat.com")

    -- Delete emails from FB workplace
    delete_mail_from(account, "fbworkmail.com")
    delete_mail_from(account, "accesso via Workplace")

    -- Delete Spam
    delete_mail_from(account, "hostepro.co.ua")
    delete_mail_from(account, "no-reply@sciencemuseum.ac.uk")

    -- Alerts

    -- Github
    delete_mail_from(account, "builds@circleci.com")
    delete_mail_from(account, "notifications@github.com")


    -- Move hlin emails to hlin mailbox
    move_if_to_contains(account, "hlin@noreply.github.com", "Hlin")

    -- Move Sales reports to Sales Reports folder
    move_if_subject_contains(account, "Sales attached", "Sales Reports")

    -- Archive old emails -- Not working and I don't really know why...
    -- archive_if_older_than(account, 90)
end

function move_if_subject_contains(account, subject, mailbox)
    print("move mail if subject: " .. subject)
    filtered = account.INBOX:contain_subject(subject)
    filtered:move_messages(account[mailbox])
end

function move_if_to_contains(account, to, mailbox)
    print("move mail if to: " .. to)
    filtered = account.INBOX:contain_to(to)
    filtered:move_messages(account[mailbox])
end

function move_if_from_contains(account, from, mailbox)
    print("move mail from: " .. from)
    filtered = account.INBOX:contain_from(from)
    filtered:move_messages(account[mailbox])
end

function delete_mail_from(account, from)
    print("delete mail from: " .. from)
    filtered = account.INBOX:is_new() *
               account.INBOX:contain_from(from)
    filtered:delete_messages()
end

function delete_mail_if_subject_contains(account, subject)
    print("delete mail with subject: " .. subject)
    filtered = account.INBOX:is_new() *
               account.INBOX:contain_subject(subject)
    filtered:delete_messages()
end

function delete_mail_to(account, to)
    print("delete mail to: " .. to)
    filtered = account.INBOX:is_new() *
               account.INBOX:contain_to(to)
    filtered:delete_messages()
end

function archive_if_older_than(account, days)
    print("archive messages older than: " .. days .. " days")
    filtered = account.INBOX:is_older(days)
    filtered:move_messages(account["Archive"])
end

main() -- Call the main function
