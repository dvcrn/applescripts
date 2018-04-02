tell application id "DNtp"

	set theSelection to selection
	if theSelection is {} then error "Please select something"

	set currentGroup to current group

	repeat with thisItem in theSelection
		set itemPath to path of thisItem
		set itemName to name of thisItem
		set pdfPath to "/tmp/(OCR) - " & itemName & ".pdf"

		tell application "FineReader"
			repeat while is busy
				delay 1
			end repeat

			export to pdf pdfPath from file itemPath image quality high quality ocr languages enum [Japanese, English, GermanNewSpelling]

			repeat while is busy
				delay 1
			end repeat
		end tell

		-- pdf conversion is now done, reimport into DT
		import pdfPath to currentGroup
	end repeat

end tell

