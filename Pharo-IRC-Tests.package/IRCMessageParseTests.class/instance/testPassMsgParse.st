tests
testPassMsgParse
	"Tests whether a PASS message
	is parsed correctly"
	| ex1 msg |
	ex1 := 'PASS secretpasswordhere'.
	msg := IRCProtocolMessage fromString: ex1.
	self assert: (msg command = #PASS).
	self assert: (msg arguments size) = 1.
	self assert: (msg prefix isNil).
	self assert: ex1 = (msg asString).
	