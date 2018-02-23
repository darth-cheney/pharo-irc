tests
testSendMessageToChannel
	"Tests #sendMessage:toChannel:"
	| ex chan |
	ex := IRCProtocolMessage fromString: ':other-user!verizon.cc.net PRIVMSG #test :Hello this is my message'.
	chan := IRCChannel connection: conn named: '#test'.
	conn addChannel: chan.
	conn sendMessage: ex toChannel: chan.
	self assert: ((conn channels at: '#test') messageLog includes: ex).