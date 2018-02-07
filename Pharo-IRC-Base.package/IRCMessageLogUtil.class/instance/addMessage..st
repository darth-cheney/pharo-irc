adding
addMessage: anIRCMessage
	(messageLog size > 1000)
		ifTrue: [ 
			self writeOutAndClear ].
	messageLog add: anIRCMessage