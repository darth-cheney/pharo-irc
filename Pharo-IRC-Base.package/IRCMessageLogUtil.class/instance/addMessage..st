adding
addMessage: anIRCMessage
	(messageLog size > 500)
		ifTrue: [ 
			self writeOutAndClear ].
	messageLog add: anIRCMessage