initialization
handleIncoming
	"Process an deal with any available messages
	in the inQueue"
	inQueue ifEmpty: [ ^ self ].
	announcer announce: (IRCSystemMessageAnnouncement new messages: (inQueue copy); type: #incoming).
	inQueue removeAll.