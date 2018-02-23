tests
testAddSubscriberOn
	"Tests the connection's ability to add a
	subscriber to the announcer for IRCMessageAnnouncements
	with a given selector."
	| message |
	message := IRCProtocolMessage fromString: 'PRIVMSG #test-channel :hello, world!'.
	conn addSubscriber: self on: #receiveMsgAnn:.
	self assert: (conn privAnnouncer hasSubscriber: self).
	conn privAnnouncer announce: (IRCMessageAnnouncement new message: message).
	self assert: (self receivedMsgAnn message) equals: message.
	