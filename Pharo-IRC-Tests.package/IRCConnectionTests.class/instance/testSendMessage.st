tests
testSendMessage
	"Should add the message to the outQueue
	and also the connection's message log"
	| ex1 ex2 |
	ex1 := IRCProtocolMessage fromString: 'JOIN #test1'.
	ex2 := IRCProtocolMessage fromString: 'PRIVMSG #test1 :Hey this is a chat message!'.
	conn sendMessage: ex1.
	self assert: (conn privOutQueue includes: ex1).
	self assert: (conn messageLog includes: ex1).
	conn sendMessage: ex2.
	self assert: (conn privOutQueue includes: ex2).
	self assert: (conn messageLog includes: ex2).