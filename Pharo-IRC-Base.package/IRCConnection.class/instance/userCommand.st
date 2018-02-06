initialization
userCommand
	"Composes an IRCProtocolMessage
	for the USER command using this 
	connection's current username, nick,
	and fullName settings."

	self
		sendMessage: (IRCProtocolMessage new
							command: 'USER'
							arguments: { user username. '8'. '*' }
							trailer: user fullName).