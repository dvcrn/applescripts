-- primaryEmail is used to identify the primary account
set primaryEmail to "my@email.com"

-- a list of domains that the primary account has authority over
set primaryDomains to {"@email.com", "@name.com", "@somethingelse.com"}

on selectedEmailRecipient()
	tell application "Mail"
		set theMessages to selected messages of first message viewer
		set theMessage to first item of theMessages
		set allHeaders to all headers of theMessage

		set toEmailRegex to "\\b^To: [A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}\\b"
		set emailRegex to "\\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}\\b"

		set extractScript to "echo " & quoted form of allHeaders
		set extractScript to extractScript & " | grep -Eio '" & toEmailRegex & "' " -- limit to only the To: address
		set extractScript to extractScript & " | grep -Eio '" & emailRegex & "' " -- get the actual email

		set extractedEmail to do shell script extractScript
	end tell
end selectedEmailRecipient

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

	set newEmails to {}
	-- always copy the primary email
	copy primaryEmail to the end of newEmails

	try
		set recipient to my selectedEmailRecipient()
		-- check if the recipient is part of our domain
		repeat with domain in primaryDomains
			if recipient contains domain then
				copy recipient to the end of newEmails
			end if
		end repeat
	end try

	set email addresses of account accountName to newEmails
end tell

