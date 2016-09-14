on run {}
  repeat with _action in my selectedActions()
    my processAction(_action)
  end repeat
end run

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

on processAction(_action)
  tell application "OmniFocus"
    set _action's due date to my calculateDate(_action's due date)
  end tell
end processAction

on calculateDate(_oldDate)
  if _oldDate is missing value then
    set _date to current date
    set day of _date to ((_date's day) - 1)
    set time of _date to 8 * hours
    return _date
  else
    set day of _oldDate to ((_oldDate's day) - 1)
    return _oldDate
  end if
end calculateDate

