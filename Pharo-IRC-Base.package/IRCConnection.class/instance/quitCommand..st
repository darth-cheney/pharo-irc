initialization
quitCommand: aQuitMessage
	"Composes an IRCProtocolMessage for the
	QUIT command, using the passed string
	as the leaving message (trailer)."
	
	self
		sendMessage: (IRCProtocolMessage new
							command: 'QUIT'
							arguments: {}
							trailer: aQuitMessage).