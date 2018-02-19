tests
testSendMessageToActiveChans
	"Ensures that the connection can send some
	messages to channels that are marked as active"
	| chan1 chan2 chan3 msg |
	chan1 := IRCChannel connection: conn named: '#test1'.
	chan1 active: true.
	conn addChannel: chan1.
	chan2 := IRCChannel connection: conn named: '#test2'.
	conn addChannel: chan2.
	chan2 active: true.
	chan3 := IRCChannel connection: conn named: '#test3'.
	conn addChannel: chan3.
	msg := IRCProtocolMessage fromString: ':server@server.server NOTICE :this is a message'.
	
	conn sendMessageToActiveChans: msg.
	self assert: (chan1 messageLog includes: msg).
	self assert: (chan2 messageLog includes: msg).
	self deny: (chan3 messageLog includes: msg).
	

