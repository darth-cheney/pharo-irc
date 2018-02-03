initialization
initialHandshake
	"Send the initial NICK and USER messages
	when performing an initial connection to a server."
	self sendMessage: (IRCProtocolMessage command: 'NICK' arguments: { username }).
	self sendMessage: (IRCProtocolMessage command: 'USER' arguments: {
		username.
		'*'.
		'*'.
		username.}).
		