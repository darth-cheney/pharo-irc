as yet unclassified
sendPrivateMessage: aString
	"Tells the receiver to send the contents
	of the incoming string as a PRIVMSG. The string
	should comprise the arguments and trailer of 
	an IRCProtocolMessage"
	| stream target content msg |
	stream := ReadStream on: aString.
	target := stream upTo: $ .
	content := (stream upToEnd) trimBoth.
	msg := IRCProtocolMessage new.
	msg
		command: 'PRIVMSG';
		arguments: target;
		trailer: content.
	self connection sendMessage: msg.