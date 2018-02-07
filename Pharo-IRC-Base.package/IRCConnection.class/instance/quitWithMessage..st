as yet unclassified
quitWithMessage: anIRCMessage
	"Cease all activity on the socket
	after announcing a final quit message"
	| ann |
	ann := IRCQuitAnnouncement new message: anIRCMessage.
	announcer announce: ann.
	channels do: [ :chan |
		chan privAnnouncer announce: ann ].
	self disconnect.