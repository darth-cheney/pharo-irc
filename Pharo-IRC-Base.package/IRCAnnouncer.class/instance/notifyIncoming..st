as yet unclassified
notifyIncoming: anIRCMessage
	incomingSubscribers do: [ :subscriber |
		subscriber incomingIRCMessage: anIRCMessage ].