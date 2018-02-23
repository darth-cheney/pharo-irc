irc-modes
modeForChanNamed: aChannelName
	"Attempt to respond with the mode set
	for the user at the given channel name
	on chanModes. Signal an error if not there."
	^ self 
		modeForChanNamed: aChannelName 
		ifAbsent: [ IRCUserNotInChannel signal ].