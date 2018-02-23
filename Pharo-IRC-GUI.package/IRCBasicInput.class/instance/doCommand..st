accessing
doCommand: aText
	"Because this text begins with a
	slash, we parse out the command and
	create an IRCProtocolMessage object
	that approximates what's going on."
	| readStream msg command rest |
	readStream := ReadStream on: aText.
	readStream next.
	command := (readStream upTo: $ ) asUppercase.
	rest := readStream upToEnd.
	msg := IRCProtocolMessage command: command arguments: rest.
	self announceMessage: msg.
	
	