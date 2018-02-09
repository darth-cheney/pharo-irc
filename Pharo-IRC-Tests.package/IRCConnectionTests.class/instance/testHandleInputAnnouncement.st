tests
testHandleInputAnnouncement
	"Tests the connection's ability to properly
	handle an IRCInputAnnouncement. The handler should
	put the message in the announcement into the 
	outQueue"
	| message announcement |
	message := IRCProtocolMessage fromString: 'JOIN #test-channel'.
	announcement := (IRCInputMessageAnnouncement new message: message).
	conn perform: #handleInputAnnouncement: with: announcement.
	self assert: (conn outQueueSize) equals: 1.
	