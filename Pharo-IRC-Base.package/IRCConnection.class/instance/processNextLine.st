initialization
processNextLine
	"Parses any incoming lines into
	an IRCProtocolMessage and appends to
	the inQueue."
	| msg |
	msg := (IRCProtocolMessage fromString: (connection nextLine)).
	inQueue add: msg.
	msgLog add: msg.