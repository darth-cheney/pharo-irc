as yet unclassified
broadcast
	"Notify all subscribers to outgoing messages"
	outgoingQueue ifNotEmpty: [ 
		outgoingQueue do: [ :outMsg |
			stream sendCommand: (outMsg toString).
			self announcer notifyOutgoing: outMsg ].
		outgoingQueue removeAll ].
	
	"Notify all subscribers to incoming messages"
	incomingQueue ifNotEmpty: [ 
		incomingQueue do: [ :inMsg |
			self announcer notifyIncoming: inMsg ].
		incomingQueue removeAll ].
	
	