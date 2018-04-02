-- Insert path into apple sheet dialogue

set SaveFolderPath to "/tmp"

tell application "System Events"
	tell process "Safari"
		tell sheet 1 of window 1
			set value of text field 1 to SaveFolderPath
		end tell
	end tell
end tell
