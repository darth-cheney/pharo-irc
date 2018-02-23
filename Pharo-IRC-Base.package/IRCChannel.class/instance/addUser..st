adding
addUser: anIRCUser
	"Adds the passed IRCUser to the receiver's
	users collection, but also ensures that the
	modeset for the channel is updated for that
	user"
	users add: anIRCUser.
	"If a user's nick begins with a symbol,
	it's a RPL_NAMEREPLY and indicates a mode
	needs to be changed for the channel"
	anIRCUser channelModes at: (self name) put: (Set new).
	(anIRCUser nickname first isAlphaNumeric)
		ifFalse: [ self modeFromPrefixForUser: anIRCUser ].