as yet unclassified
processIncoming: anIRCMessage
	"Deal with handling an incoming irc message.
	This exists separately from handleIncoming:
	so that we can re-write messages from the
	channel log."
	| newString |
	(anIRCMessage command = 'PRIVMSG')
		ifTrue: [ 
			self printIncomingMsg: anIRCMessage.
			^ self ].
	newString := String streamContents: [ :stream |
		stream
			nextPutAll: (anIRCMessage asString);
			crlf ].
	self addTextToLog: (newString asText).