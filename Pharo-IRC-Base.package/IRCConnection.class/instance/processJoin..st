message-processing
processJoin: anIRCMessage
	"Handle #JOIN messages from the server.
	These include the current user successfully
	joining a given channel and other users
	joining a channel in which the user is 
	present"
	| channelName |
	
	"Chan names can be the first argument or the trailer"
	(anIRCMessage arguments isNotEmpty)
		ifTrue: [ channelName := anIRCMessage arguments first ]
		ifFalse: [ channelName := anIRCMessage trailer ].
	
	"If the nick referenced in the message is the
	current user, we create a new channel and return"
	(self prefixIsNickname: anIRCMessage)
		ifTrue: [ 
			| newChan |
			newChan := IRCChannel connection: self named: channelName.
			self addChannel: newChan.
			announcer announce: (IRCJoinedChannelAnnouncement new 
																			channel: newChan;
																			message: anIRCMessage).
			^ self sendMessage: anIRCMessage toChannelNamed: channelName ]
		ifFalse: [ 
			^ self sendMessage: anIRCMessage toChannelNamed: channelName ].