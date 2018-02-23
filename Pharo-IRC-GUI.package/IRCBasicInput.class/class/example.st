example
example
	| connection |
	connection := IRCConnection new.
	connection
		nickname: 'pharo-irc-user';
		hostname: 'irc.freenode.net'.
	
	"Set up the basic GUI on the connection"
	self connection: connection.
	
	"Connect"
	connection connect.
	
	"To join a channel, type /join <channelName> in the main window"