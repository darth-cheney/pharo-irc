message-processing
processNextMessage: anIRCMessage
	"Handle the processing of the next incoming
	message from the socket."
	| handler |
	anIRCMessage incoming: true.
	msgLog add: anIRCMessage.
	announcer announce: (IRCLogMessageAnnouncement new message: anIRCMessage).
	handler := self class incomingHandlers
							at: (anIRCMessage command)
							ifAbsent: [ nil ].
	handler ifNil: [ 
		announcer announce: (IRCMessageAnnouncement new message: anIRCMessage).
		unprocessedMessages add: anIRCMessage.
		^ self ].
	
	^ self perform: handler with: anIRCMessage.
	