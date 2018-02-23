as yet unclassified
sendMessageToActiveChans: aMessage
	"Sends the passed message to all channels
	on the connection that are 'active', meaning
	set to receive general server messages"
	channels do: [ :chan |
		chan isActive ifTrue: [ 
			chan incomingMessage: aMessage ] ].