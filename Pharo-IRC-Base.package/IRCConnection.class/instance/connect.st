ssl
connect
	"Opens a new SocketStream with the specified host and port."
	stream := SocketStream openConnectionToHostNamed: host port: port.
	self listen.
	
	"Send the nick command with the current nick"
	self sendMessage: (IRCSystemMessage command: 'NICK' arguments: {self nick}).
	
	"Send the user and nick commands"
	self sendMessage: (IRCSystemMessage command: 'USER' arguments: {
		self userName.
		'*'.
		'*'.
		self fullName }).
	
	