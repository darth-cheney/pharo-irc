tests
testSendMessageToChannelNamed
	| ex1 ex2 chan1 chan2 |
	ex1 := IRCProtocolMessage fromString: ':user!server JOIN :#test1'.
	ex2 := IRCProtocolMessage fromString: ':user!server JOIN :#test2'.
	chan1 := IRCChannel connection: conn named: '#test1'.
	chan2 := IRCChannel connection: conn named: '#test2'.
	conn
		addChannel: chan1;
		addChannel: chan2.
	conn sendMessage: ex1 toChannelNamed: '#test1'.
	self assert: (chan1 messageLog includes: ex1).
	self deny: (chan1 messageLog includes: ex2).
	
	conn sendMessage: ex2 toChannelNamed: '#test2'.
	self assert: (chan2 messageLog includes: ex2).
	self deny: (chan2 messageLog includes: ex1).
	