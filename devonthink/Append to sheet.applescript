tell application id "com.devon-technologies.thinkpro2"
	set currentSheet to get record with uuid "xxxx"
  set newRow to "new row" -- text to append

	if type of currentSheet is sheet then
		set n to count of columns of currentSheet
		set theCells to cells of currentSheet

		set theRow to {}
		set end of theRow to newRow

		set end of theCells to theRow
		set cells of currentSheet to theCells
	end if
end tell
