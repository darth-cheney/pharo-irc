message-processing
processJoin: anIRCMessage
	"Handle #JOIN messages from the server.
	These include the current user successfully
	joining a given channel and other users
	joining a channel in which the user is 
	present"
	| channelName user foundChan |
	channelName := anIRCMessage arguments first.
	user := anIRCMessage prefix.
	
	"Taken from squIRC #processJoin:"
	(user includes: $!)
		ifTrue: [ 
			user := user copyFrom: 1 to: (user indexOf: $!) - 1 ].
	foundChan := channels at: channelName ifAbsent: [ nil ].
	foundChan
		ifNotNil: [ 
			self sendMessage: anIRCMessage toChannel: foundChan.
			^ self ].
	"If the JOIN message refers to the current user,
	we need to create a new channel"
	(user = self nickname)
		ifTrue: [ 
			self addChannelNamed: channelName ].
	
	"Otherwise announce it on the main message announcer"
	announcer announce: (IRCMessageAnnouncement new message: anIRCMessage).