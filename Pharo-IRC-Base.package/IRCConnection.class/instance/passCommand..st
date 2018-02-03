initialization
passCommand: aPassword
	"Composes an IRCProtocolMessage for the
	PASS command and sends along the appropriate
	password to the server."
	
	self 
		sendMessage: (IRCProtocolMessage new
								command: 'PASS'
								arguments: { aPassword }).