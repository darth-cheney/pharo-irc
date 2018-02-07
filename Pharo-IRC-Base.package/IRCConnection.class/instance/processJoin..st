message-processing
processJoin: anIRCMessage
	"Handle #JOIN messages from the server.
	These include the current user successfully
	joining a given channel and other users
	joining a channel in which the user is 
	present"
	| channelName userName foundChan |
	(anIRCMessage arguments isNotEmpty)
		ifTrue: [ channelName := anIRCMessage arguments first ]
		ifFalse: [ channelName := anIRCMessage trailer ].

	userName := anIRCMessage prefix.
	
	"Taken from squIRC #processJoin:"
	(userName includes: $!)
		ifTrue: [ 
			userName := userName copyFrom: 1 to: (userName indexOf: $!) - 1 ].
	foundChan := channels at: channelName ifAbsent: [ nil ].
	foundChan
		ifNotNil: [ 
			self sendMessage: anIRCMessage toChannel: foundChan.
			^ self ].
	"If the JOIN message refers to the current user,
	we need to create a new channel"
	(userName = self nickname)
		ifTrue: [ 
			self addChannelNamed: channelName ].
	
	"Otherwise announce it on the main message announcer"
	announcer announce: (IRCMessageAnnouncement new message: anIRCMessage).