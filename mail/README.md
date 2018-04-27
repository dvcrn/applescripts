# Mail.app applescripts

## extract-recipient.applescript

The Mail.app applescript interface doesn't support getting the recipient of a message. This applescript extracts this from the email headers as workaround

## recipient-to-alias.applescript

A hack for people using catch-all email addresses. This is extracting the recipient of the currently selected email, matches it against a list of domains and if valid, adds it as an alias to the primary account.

I use this with Keyboard Maestro when I hit `cmd-r` to automatically add the recipient to my aliases before composing a reply.

## daily-temporary-alias.applescript

Generates a new email address every day and adds it as alias to the primary account. I use this as burner email for replies where I don't want to expose any of my emails (for example spam).
