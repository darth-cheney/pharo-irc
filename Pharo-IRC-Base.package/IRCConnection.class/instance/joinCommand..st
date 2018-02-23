initialization
joinCommand: aJoinString
	"Composes an IRCProtocolMessage for the
	JOIN command. The passed aJoinString
	should comply with the RFC string format.
	NOTE that the message instance will
	automatically parse the args from the string
	when passed in.
	See section 3.2.1 or RFC 2812 for more
	information"
	self
		sendMessage: (IRCProtocolMessage new
							command: 'JOIN'
							arguments: aJoinString).