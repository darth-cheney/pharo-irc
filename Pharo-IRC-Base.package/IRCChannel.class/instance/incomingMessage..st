message-processing
incomingMessage: anIRCMessage
	"How incoming (from server or connection)
	IRC messages should be handled by the channel"
	| handler |
	msgLog add: anIRCMessage.
	handler := self class incomingHandlers
							at: (anIRCMessage command)
							ifAbsent: [ nil ].
	handler ifNil: [ ^ self announce: (IRCMessageAnnouncement new message: anIRCMessage) ].
	
	^ self perform: handler with: anIRCMessage