adding
addChanMode: aModeString forChanNamed: aChannelName
	"Will attempt to add the given mode(s)
	in the passed modestring to the receiver's
	chanModes dict for the given channel"
	(chanModes includesKey: aChannelName)
		ifFalse: [ IRCUserNotInChannel signal ].
	(chanModes at: aChannelName)
		addAll: aModeString.