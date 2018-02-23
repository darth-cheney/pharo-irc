initialization
setUp
	conn := IRCConnection new.
	chan := IRCChannel connection: conn named: '#test'.
	conn addChannel: chan.
	self resetAnnouncers