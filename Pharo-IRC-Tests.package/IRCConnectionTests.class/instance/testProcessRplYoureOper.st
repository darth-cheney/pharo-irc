tests
testProcessRplYoureOper
	"Ensures that RPL_YOUREOPER (381)
	replies set the connection's user to
	be a server operator."
	| example |
	example := IRCProtocolMessage fromString: ':server@server.serv 381 :You are now IRC Operator'.
	self listenForMsgAnnFrom: conn privAnnouncer.
	conn processRplYoureOper: example.
	self assert: (self receivedMsgAnn isNotNil).
	self assert: (self receivedMsgAnn message) equals: example.
	self assert: (conn user mode includes: $o).
	self assert: (conn user isOperator).