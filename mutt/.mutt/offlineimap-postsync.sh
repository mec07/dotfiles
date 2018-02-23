#!/usr/local/bin/bash

/usr/local/bin/fish ~/.mutt/collect_folders.fish liveerrors > ~/.mutt/mailboxes.liveerrors
/usr/local/bin/fish ~/.mutt/collect_folders.fish work > ~/.mutt/mailboxes.work

notmuch new
