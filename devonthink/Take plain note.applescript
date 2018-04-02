-- Fuzzy search for a service that contains "Take Plain Note" and click on it
-- Used for DEVONthinks 'Take Plain Note In DevonTHINK(...)' service

tell application "System Events"
	set frontApp to first application process whose frontmost is true
	set frontAppName to name of frontApp

	tell frontApp
		tell menu bar 1
			tell menu 1 of menu bar item frontAppName
				tell menu item "Services"
					tell menu "Services"
						click first menu item whose name contains "Take Plain Note"
					end tell
				end tell
			end tell
		end tell
	end tell
end tell
