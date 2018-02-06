tests
testOperMsgParse
	"Tests for parsing of the OPER
	message. This is an outbound-only
	message."
	| ex1 msg |
	ex1 := 'OPER foo bar'.
	msg := IRCProtocolMessage fromString: ex1.
	self assert: (msg command = 'OPER').
	self assert: (msg arguments size = 2).
	self assert: (msg prefix isNil).
	self assert: (msg trailer isNil).
	self assert: ex1 = (msg asString).