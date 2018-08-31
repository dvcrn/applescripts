on run {}
	repeat with _action in my selectedActions()
		my processAction(_action)
	end repeat
end run


# ----- Boilerplate for filtering only things we actually care about (tasks)
on selectedActions()
	tell application "OmniFocus"
		return my filterValues(my selectedValues(), {inbox task, task, available task, remaining task})
	end tell
end selectedActions

on selectedValues()
	tell application "OmniFocus"
		return value of selected trees of content of first document window of front document
	end tell
end selectedValues

on filterValues(_values, _classes)
	tell application "OmniFocus"
		set _result to {}
		repeat with _value in _values
			if _classes contains _value's class then
				copy _value to end of _result
			end if
		end repeat
		return _result
	end tell
end filterValues

# ----- Actual code
on processAction(_action)
	tell application "OmniFocus"
		# Trim exclamation marks from title
		set sedCmd to "echo \"" & _action's name & "\"|sed \"s/^[\\!\\ ]*//g\"" as string
		set trimmedName to do shell script sedCmd
		set _action's name to "!! " & trimmedName
	end tell
end processAction

