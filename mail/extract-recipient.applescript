tell application "Mail"
	set theMessages to selected messages of first message viewer
	set theMessage to first item of theMessages
	set allHeaders to all headers of theMessage

	set emailRegex to "\\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}\\b"

	set extractScript to "echo " & quoted form of allHeaders
	set extractScript to extractScript & " | grep -E '\\b^To:'" -- limit to only the 'To:' header
	set extractScript to extractScript & " | grep -Eio '" & emailRegex & "' " -- get the actual email

	set extractedEmail to do shell script extractScript
end tell
