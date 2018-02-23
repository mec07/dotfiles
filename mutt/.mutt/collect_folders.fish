function collect_folders
    set original_dir (pwd)
    cd ~/Maildir/$argv/
    set all_mailboxes (find . -type d | grep -v '\(cur\|new\|tmp\)$' | sed "s/\.\///g")
    set mailbox_string 'mailboxes'
    for a_mailbox in $all_mailboxes
        if [ $a_mailbox != "." ]
            set -lx mailbox_contains_mail (contains_mail ~/Maildir/$argv/$a_mailbox)
            if [ $mailbox_contains_mail = "true" ]
                set mailbox_string "$mailbox_string \"+$a_mailbox\""
            end
        end
    end
    cd $original_dir
    echo $mailbox_string
end

function contains_mail
    set -lx cur (count_files_in $argv/cur)
    set -lx tmp (count_files_in $argv/tmp)
    set -lx new (count_files_in $argv/new)
    set -lx total (math $cur + $new + $tmp)
    if [ $total -gt 0 ]
        echo "true"
    else
        echo "false"
    end
end

function count_files_in
    echo (ls $argv ^ /dev/null | wc -l)
end

collect_folders $argv
