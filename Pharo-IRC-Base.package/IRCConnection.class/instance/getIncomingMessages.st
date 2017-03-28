as yet unclassified
getIncomingMessages
	"If connected, checks for new messages on
	 the SocketStream and appends each one to
	 the incomingMessages collection"
	stream ifNil: [ ^ self ].
	[ stream isDataAvailable ] whileTrue: [ incomingMessages add: (stream nextLine) ].