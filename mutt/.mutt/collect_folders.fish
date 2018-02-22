function collect_folders
    set original_dir (pwd)
    cd ~/Maildir/$argv/
    set all_mailboxes (find . -type d | grep -v '\(cur\|new\|tmp\)$' | sed "s/\.\///g")
    set mailbox_string ''
    for a_mailbox in $all_mailboxes
        if [ $a_mailbox != "." ]
            set -lx mailbox_contains_mail (contains_mail ~/Maildir/$argv/$a_mailbox)
            if [ $mailbox_contains_mail = "true" ]
                set mailbox_string "$mailbox_string =\"$a_mailbox\""
            end
        end
    end
    cd $original_dir
    echo $mailbox_string
end

function contains_mail
    set -lx folder_contains_cur (folder_contains $argv/cur)
    set -lx folder_contains_tmp (folder_contains $argv/tmp)
    set -lx folder_contains_new (folder_contains $argv/new)
    if [ $folder_contains_cur = "true" ]
        set -x cur (ls $argv/cur | wc -l)
    else
        set -x cur 0
    end
    if [ $folder_contains_tmp = "true" ]
        set -x tmp (ls $argv/tmp | wc -l)
    else
        set -x tmp 0
    end
    if [ $folder_contains_new = "true" ]
        set -x new (ls $argv/new | wc -l)
    else
        set -x new 0
    end
    set -lx total (math $cur + $new + $tmp)
    if [ $total -gt 0 ]
        echo "true"
    else
        echo "false"
    end
end

function folder_contains
    if ls $argv > /dev/null ^ /dev/null
        echo "true"
    else
        echo "false"
    end
end

collect_folders $argv
