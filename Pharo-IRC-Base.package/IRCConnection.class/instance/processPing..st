message-processing
processPing: anIRCMessage
	| response |
	response := IRCProtocolMessage new.
	response
		command: 'PONG';
		arguments: anIRCMessage arguments;
		trailer: anIRCMessage trailer.
	self sendMessage: response.
	announcer announce: (IRCMessageAnnouncement new message: anIRCMessage).