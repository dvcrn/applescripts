tell application "System Events" to tell disk item (theFile as text) to set {theName, theExtension} to {name, name extension}
if theExtension is not "" then set theName to text 1 thru -((count theExtension) + 2) of theName -- the name part

tell application "Finder" to set hazelPath to (container of alias (theFile as string)) as text
set pdfPath to hazelPath & "(OCR) " & theName & ".pdf"

tell application "FineReader"
	repeat while is busy
		delay 1
	end repeat

	export to pdf pdfPath from file theFile image quality high quality ocr languages enum [Japanese, English, GermanNewSpelling]

	repeat while is busy
		delay 1
	end repeat
end tell
