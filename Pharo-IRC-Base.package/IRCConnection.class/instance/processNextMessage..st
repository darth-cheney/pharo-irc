message-processing
processNextMessage: anIRCMessage
	"Handle the processing of the next incoming
	message from the socket."
	| handler |
	msgLog add: anIRCMessage.
	handler := self class incomingHandlers
							at: (anIRCMessage command)
							ifAbsent: [ nil ].
	handler ifNil: [ 
		announcer announce: (IRCMessageAnnouncement new message: anIRCMessage).
		^ self ].
	
	^ self perform: handler with: anIRCMessage.
	