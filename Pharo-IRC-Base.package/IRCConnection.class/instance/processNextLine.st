initialization
processNextLine
	"Intermediary method in which we
	snatch the next line off of the socket"
	| nextLine |
	nextLine := connection nextLine.
	self processNextMessage: (IRCProtocolMessage fromString: nextLine).