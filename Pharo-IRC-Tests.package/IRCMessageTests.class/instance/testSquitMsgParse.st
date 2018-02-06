tests
testSquitMsgParse
	"Tests both incoming and outgoing
	SQUIT message formatting"
	| in out inMsg outMsg |
	in := ':Trillian SQUIT cm22.eng.umd.edu :Server out of control'.
	out := 'SQUIT tolsun.oulu.fi :Bad Link ?'.
	inMsg := IRCProtocolMessage fromString: in.
	self assert: (inMsg command = #SQUIT).
	self assert: (inMsg prefix isNotNil).
	self assert: (inMsg arguments isNotEmpty).
	self assert: (inMsg trailer isNotNil).
	self assert: in = (inMsg asString).
	
	outMsg := IRCProtocolMessage fromString: out.
	self assert: (outMsg command = #SQUIT).
	self assert: (outMsg trailer isNotNil).
	self assert: (outMsg prefix isNil).
	self assert: out = (outMsg asString).