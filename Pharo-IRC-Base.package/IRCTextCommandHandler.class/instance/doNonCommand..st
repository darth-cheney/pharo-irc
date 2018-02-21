as yet unclassified
doNonCommand: aLineOfText
	"Receiver will handle any line of text
	that does not begin with the commandChar,
	usually '/'. Typically, this will be used to
	send a PRIVMSG on a channel when in a channel context"
	| msg userMsg |
	self isInChannel ifFalse: [ 
		^ self ].
	msg := IRCProtocolMessage fromString: (String streamContents: [ :s |
		s
			nextPutAll: 'PRIVMSG';
			nextPut: $ ;
			nextPutAll: self channel name;
			nextPut: $ ;
			nextPut: $:;
			nextPutAll: (aLineOfText asString)]).
	self connection sendMessage: msg.
	userMsg := IRCProtocolMessage fromString: (msg asString).
	userMsg prefix: (self connection nickname).
	self channel incomingMessage: userMsg.