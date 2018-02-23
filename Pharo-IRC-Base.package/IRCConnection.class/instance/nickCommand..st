initialization
nickCommand: aNickname
	"Composes an IRCProtocolMessage for the
	NICK command with the passed nickname
	string and sends."
	
	self
		sendMessage: (IRCProtocolMessage new
							command: 'NICK'
							arguments: { aNickname }).