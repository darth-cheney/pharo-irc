as yet unclassified
quitWithMessage: anIRCMessage
	"Cease all activity on the socket
	after announcing a final quit message"
	| ann |
	ann := IRCQuitAnnouncement new message: anIRCMessage.
	announcer announce: ann.
	self sendMessageToAllChans: anIRCMessage.
	self channels removeAll.
	self disconnect.