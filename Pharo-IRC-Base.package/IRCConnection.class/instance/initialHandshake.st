initialization
initialHandshake
	"Send the initial NICK and USER messages
	when performing an initial connection to a server."
	self password ifNotNil: [ 
		self sendMessage: (IRCProtocolMessage fromString: 'PASS ',(self password)) ].
	self sendMessage: (IRCProtocolMessage command: 'NICK' arguments: { user nickname }).
	self sendMessage: (IRCProtocolMessage command: 'USER' arguments: {
		user username.
		'*'.
		'*'.
		user username.}).
		