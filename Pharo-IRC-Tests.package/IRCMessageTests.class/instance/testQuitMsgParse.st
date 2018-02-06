tests
testQuitMsgParse
	"Test both an outbound and inbound
	QUIT message."
	| in out inMsg outMsg |
	out := 'QUIT :Gone to have lunch'.
	in := ':syrk!kalt@millennium.stealth.net QUIT :Gone to have lunch'.
	outMsg := IRCProtocolMessage fromString: out.
	self assert: (outMsg command = #QUIT).
	
	inMsg := IRCProtocolMessage fromString: in.
	self assert: (inMsg command = #QUIT).
	self assert: (inMsg prefix isNotNil).
	