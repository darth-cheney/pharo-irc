as yet unclassified
sendMessageToAllChans: anIRCMessage
	"Loops through all open channels
	and sends them the received message"
	self channels do: [ :chan |
		chan incomingMessage: anIRCMessage ].
	