#!/usr/local/bin/bash

#/usr/local/bin/fish ~/.mutt/collect_folders.fish liveerrors > ~/.mutt/.mailboxes.liveerrors.tmp
#mv ~/.mutt/.mailboxes.liveerrors.tmp ~/.mutt/mailboxes.liveerrors
/usr/local/bin/fish ~/.mutt/collect_folders.fish work > ~/.mutt/.mailboxes.work.tmp
mv ~/.mutt/.mailboxes.work.tmp ~/.mutt/mailboxes.work

#notmuch new
