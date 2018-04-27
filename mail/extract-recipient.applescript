tell application "Mail"
	set theMessages to selected messages of first message viewer
	set theMessage to first item of theMessages
	set allHeaders to all headers of theMessage

	set toEmailRegex to "\\b^To: [A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}\\b"
	set emailRegex to "\\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}\\b"

	set extractScript to "echo " & quoted form of allheaders
	set extractScript to extractScript & " | grep -Eio '" & toEmailRegex & "' " -- limit to only the To: address
	set extractScript to extractScript & " | grep -Eio '" & emailRegex & "' " -- get the actual email

	set extractedEmail to do shell script extractScript
end tell
