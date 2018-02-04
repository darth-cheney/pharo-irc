initialization
handleServerCommand: anIRCMessage
	"This is where we case out specific commands
	from the server that will somehow affect the
	connection itself.
	Canonical example: a PING message, to which
	the server should immediately respond with a
	correctly-formatted PONG"
	(anIRCMessage command = 'PING') ifTrue: [ 
		 | responseMsg |
		responseMsg := IRCProtocolMessage new.
		responseMsg
			command: 'PONG';
			prefix: anIRCMessage prefix;
			arguments: anIRCMessage arguments;
			trailer: anIRCMessage trailer.
		self sendMessage: responseMsg ].