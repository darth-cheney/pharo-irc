as yet unclassified
notifyOutgoing: anIRCMessage
	outgoingSubscribers do: [ :subscriber |
		subscriber outgoingIRCMessage: anIRCMessage ].