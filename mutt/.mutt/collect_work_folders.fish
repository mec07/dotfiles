function collect_work_folders
    set original_dir (pwd)
    cd ~/Maildir/work
    set all_mailboxes (find . -type d | grep -v '\(cur\|new\|tmp\)$')
    set mailbox_string ''
    for a_mailbox in $all_mailboxes
        if [ $a_mailbox != "." ]
            set mailbox_string "$mailbox_string =\"$a_mailbox\""
        end
    end
    cd $original_dir
    echo $mailbox_string
end

collect_work_folders
