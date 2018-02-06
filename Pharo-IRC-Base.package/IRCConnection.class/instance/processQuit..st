message-processing
processQuit: anIRCMessage
	"Respond to a QUIT message from
	the server. We should close the socket connection"
	| sender |
	sender := anIRCMessage prefix.
	(sender includes: $!)
		ifTrue: [ sender := sender copyFrom: 1 to: (sender indexOf: $!) - 1 ].
	sender
		ifNotNil: [ connection close ].
	self sendMessageToAllChans: anIRCMessage.
	announcer announce: (IRCMessageAnnouncement new message: anIRCMessage).