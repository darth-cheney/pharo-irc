message-processing
processPart: anIRCMessage
	"Handle all PART messages."
	| channelName chan |
	channelName := anIRCMessage arguments first.
	chan := self channels
					at: channelName
					ifAbsent: [ nil ].
	chan
		ifNotNil: [ 
			^ self sendMessage: anIRCMessage toChannel: chan ].
	
	"As a fallback, announce on the connection"
	announcer announce: (IRCMessageAnnouncement new message: anIRCMessage).