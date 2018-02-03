initialization
handleIncoming
	"Process an deal with any available messages
	in the inQueue"
	announcer announce: (IRCSystemMessageAnnouncement new messages: (inQueue copy); type: #incoming).
	inQueue removeAll.