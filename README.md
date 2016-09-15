# OmniFocus scripts

This is my little dump of OmniFocus scripts that I use in my workflow. Most of them are meant to get
executed through something like KeyboardMaestro.

Close to all scripts in here are _single purpose_, meaning they do exactly one thing. As a result, a
lot of code is duplicated but each script is atomic.

A lot of the things you find here are inspired by my back and forth adventures between 2Do, Things
and OmniFocus. Something missing that you like to see? Open a issue and let me know!

## prioritize-through-estimation.js

This script abuses the `Estimation` field of OmniFocus to hack a pseudo-prioritization into place.
Check [this thread](https://discourse.omnigroup.com/t/got-manual-sorting-in-custom-perspectives-working/26780)
for infos!

## push-to-7pm.applescript

Applescript to, well, push all selected tasks to 7pm on the same day. I am using this very actively
to have only one _Next_ perspective and move everything that I have to do at home to after work ends
(=7pm).

Just change the time in the last function to push the tasks to some other time.

## someday.applescript

This script tries to replicate the someday/next behaviour of Things 2. The selected tasks will get
moved to a custom context `Someday / Maybe`. If already there, this script removes the context
instead.

This is meant to be used with a "Next" perspective that collects all tasks whether it has a context
or not, and a "Someday" perspective that aggregates stalled / "maybe" tasks.

## defer+/-1 / due+/-1

Adds / removes 1 day from the tasks defer or due date. Inspired by 2Do.

## remove-due/defer.applescript

Removes the due or defer date from all selected tasks. Inspired by 2Do.

## start/due-today.applescript

Updates defer or due date of all selected tasks to today. Inspired by 2Do.

## start/due-tomorrow.applescript

Updates defer or due date of all selected tasks to tomorrow. Inspired by 2Do.

## set-current-availability-to-xxx.js

Quick changes the current perspectives availability to xxx. Uses the OmniFocus internal names, not
the one in the UI:

- next = first available
- available = available
- incomplete = remaining
- all = all

Kind of inspired by Things and their way to quickly set shown tasks to 1-9.
