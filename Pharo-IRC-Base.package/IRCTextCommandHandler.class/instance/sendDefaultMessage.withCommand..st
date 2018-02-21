as yet unclassified
sendDefaultMessage: aString withCommand: aCommandString
	"Tells the receiver to simply send the command
	as a normal IRCProtocolMessage verbatim, ie with
	the incoming command string as the actual command.
	Used in cases where we don't map the entered command
	to something else."
	| msg |
	msg := (String streamContents: [ :s |
		s
			nextPutAll: aCommandString;
			nextPut: $ ;
			nextPutAll: aString]).
	self connection sendMessage: (IRCProtocolMessage fromString: msg).