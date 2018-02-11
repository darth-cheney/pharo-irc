formatting
formatMessage: anIRCMessage
	| handler |
	((anIRCMessage isIncoming not) and: [ showOutbound ])
		ifTrue: [ ^ self formatOutboundMessage: anIRCMessage ].
	handler := self class messageHandlers 
									at: (anIRCMessage command)
									ifAbsent: [ nil ].
	handler
		ifNotNil: [ ^ self perform: handler with: anIRCMessage ].
	^ self formatDefault: anIRCMessage.