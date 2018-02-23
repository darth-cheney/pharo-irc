as yet unclassified
parseExamples: aCollection 
	"Turn a collection of lines of
	text IRC messages into IRCProtocolMessage
	instances"
	^ aCollection collect: [ :item |
		IRCProtocolMessage fromString: item ].