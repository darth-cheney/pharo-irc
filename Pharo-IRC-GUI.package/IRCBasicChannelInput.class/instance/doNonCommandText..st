as yet unclassified
doNonCommandText: aText
	"Do something with text entered
	that was not a command. For the BasicInput,
	we ignore this. Subclasses like channel
	version should override."
	| msg |
	msg := IRCProtocolMessage new.
	msg
		command: 'PRIVMSG';
		arguments: { self channelName asString };
		trailer: (aText asString).
	self announceMessage: msg.
	
	"Show local version"
	self
		showChanMessage: aText
		fromUserNamed: 'You'.