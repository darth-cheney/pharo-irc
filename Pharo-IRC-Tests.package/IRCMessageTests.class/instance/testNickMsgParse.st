tests
testNickMsgParse
	"Test the parsing of the NICK
	IRC message, for both outgoing
	and incoming"
	| ex1 ex2 msg1 msg2 |
	ex1 := 'NICK Wiz'.
	ex2 := ':WiZ!jto@tolsun.oulu.fi NICK Kilroy'.
	
	"Example 1: sent by user"
	msg1 := IRCProtocolMessage fromString: ex1.
	self assert: (msg1 command = #NICK).
	self assert: (msg1 arguments size = 1).
	self assert: (msg1 trailer isNil).
	self assert: (msg1 prefix isNil).
	self assert: ex1 = (msg1 asString).
	
	"Example 2: Response by server"
	msg2 := IRCProtocolMessage fromString: ex2.
	self assert: (msg2 command = #NICK).
	self assert: (msg2 prefix isNotNil).
	self assert: (msg2 arguments isNotEmpty).
	self assert: ex2 = (msg2 asString).