initialization
operCommand: aPassword
	"Composes an IRCProtocolMessage for the
	OPER command. Note that we use the
	current IRCConnection instance's 
	username as the username for the command."
	self
		sendMessage: (IRCProtocolMessage new
							command: 'OPER'
							arguments: { username. aPassword }).