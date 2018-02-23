initialization
testAddSubscriberOn
	"Ensures that some object is appropriately
	added to the announcer of the channel
	for IRCMessageAnnouncements"
	| testMsg |
	testMsg := IRCProtocolMessage fromString: ':test-user!someserver.net JOIN #test'.
	chan
		addSubscriber: self 
		on: #receiveMsgAnn:.
	chan privAnnouncer announce: (IRCMessageAnnouncement new message: testMsg).
	self assert: (self receivedMsgAnn isNotNil).
	self assert: (self receivedMsgAnn message) equals: testMsg.
	