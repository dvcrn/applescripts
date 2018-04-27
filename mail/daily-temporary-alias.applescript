-- primaryEmail is used to identify the primary account
set primaryEmail to "my@email.com"

-- which domain should the email get generated for?
set temporaryEmailDomain to "@myspamemail"

-- the prefix is used to identify the email address so this script can clean old ones up
set temporaryEmailPrefix to "burner-"

set dateString to do shell script "date +\"%Y-%m-%d\""
set temporaryEmail to temporaryEmailPrefix & dateString & temporaryEmailDomain

tell application "Mail"

	set primaryAccount to null
	try
		repeat with acc in accounts
			if email addresses of acc contains primaryEmail then
				set primaryAccount to acc
				error 0
			end if
		end repeat
	end try

	if primaryAccount is null then
		display dialog "Couldnt find that email account"
		error 0
	end if

	set accountName to name of primaryAccount

	set currentEmails to email addresses of account accountName
	set newEmails to {}

	repeat with email in currentEmails
		if email does not contain temporaryEmailPrefix then
			set newEmails to newEmails & email
		end if
	end repeat

	copy temporaryEmail to the end of newEmails

	set email addresses of account accountName to newEmails
end tell
