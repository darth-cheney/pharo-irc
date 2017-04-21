as yet unclassified
checkForIncoming
	"Checks for incoming messages and,
	 if available, creates new message objects
	 and appends them to the incoming queue"
	[ stream isDataAvailable ] whileTrue: [ 
		| msg |
		msg := IRCSystemMessage fromString: (stream nextLine).
		incomingQueue add: msg ].