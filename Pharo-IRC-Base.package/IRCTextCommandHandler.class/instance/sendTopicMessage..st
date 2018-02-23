as yet unclassified
sendTopicMessage: aString
	"Tells the receiver to send a TOPIC
	command to the server with the incoming
	string as the arguments and/or trailer.
	Here we distinguish between being in a channel."
	| msg |
	msg := String streamContents: [ :s |
		s nextPutAll: 'TOPIC'.
		self isInChannel ifTrue: [ 
			s
				nextPut: $ ;
				nextPutAll: (self channel name) ].
		s nextPutAll: aString ].
	self connection sendMessage: (IRCProtocolMessage fromString: msg).
	