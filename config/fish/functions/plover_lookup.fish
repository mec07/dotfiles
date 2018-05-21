function plover_lookup
	ag "\"$argv\"" /Applications/Plover.app/Contents/Resources/lib/python2.7/plover/assets/main.json
	ag "\"$argv\"" /Applications/Plover.app/Contents/Resources/lib/python2.7/plover/assets/commands.json
	ag "\"$argv\"" /Applications/Plover.app/Contents/Resources/lib/python2.7/plover/assets/user.json
end
