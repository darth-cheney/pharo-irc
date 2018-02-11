initialization
setUp
	user := IRCUser nicknamed: 'pharo-user'.
	conn := IRCConnection new.
	chan := IRCChannel connection: conn named: '#test'