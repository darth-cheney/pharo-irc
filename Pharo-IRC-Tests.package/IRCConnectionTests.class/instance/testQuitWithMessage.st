tests
testQuitWithMessage
	"Tests that quitting does the following things:
	1. Announces the IRCQuitAnnouncement
	2. Disconnects the underlying SocketStream
	3. Clears all channels"
	| quitMsg testSocket |
	quitMsg := IRCProtocolMessage fromString: 'QUIT :This is an example quit message!'.
	self listenForQuitAnnFrom: conn privAnnouncer.
	{ #testChan1. #testChan2. #testChan3 } do: [ :name |
		conn addChannelNamed: name ].
	testSocket := TCPSocketEchoTest new.
	testSocket runServer.
	conn hostname: 'localhost'; port: 6666; connect.
	self assert: (conn isConnected).
	conn quitWithMessage: quitMsg.
	self deny: conn isConnected.
	self assert: (conn channels size) equals: 0.
	self assert: (self receivedQuitAnn isNotNil).
	self assert: (self receivedQuitAnn message) equals: quitMsg.