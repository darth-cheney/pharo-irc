removing
removeChanMode: aModeString forChanNamed: aChannelName
	"Will attempt to remove the given
	mode(s) (as characters) from the receiver's
	chanModes set for the specified channel.
	Signal error if the user doesn't seem to
	be on the channel."
	(chanModes includesKey: aChannelName)
		ifFalse: [ IRCUserNotInChannel signal ].
	(chanModes at: aChannelName)
		removeAll: aModeString.