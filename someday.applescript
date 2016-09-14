global somedayContextName
set somedayContextName to "Someday / Maybe"

on main()
	tell application "OmniFocus"
		tell front document
			set somedayContext to first flattened context where its name = somedayContextName
		end tell

		tell content of first document window of front document
			--Get selection
			set validSelectedItemsList to value of (selected trees where class of its value is not item and class of its value is not folder)
			set totalItems to count of validSelectedItemsList
			if totalItems is 0 then
				display notification "You need to select at least 1 task" with title "OmniFocus"
			end if

			--Perform action
			repeat with thisItem in validSelectedItemsList
				set existingContext to context of thisItem

				if existingContext is somedayContext then
					set context of thisItem to missing value
				else
					set context of thisItem to somedayContext
				end if
			end repeat
			display notification "Changed tasks:" & totalItems with title "OmniFocus"
		end tell
	end tell
end main
main()
