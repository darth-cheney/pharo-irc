initialization
processNextLine
	"Intermediary method in which we
	snatch the next line off of the socket"
	self processNextMessage: (IRCProtocolMessage fromString: connection nextLine).