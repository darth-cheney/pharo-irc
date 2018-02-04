as yet unclassified
handleInputAnnouncement: anInputAnnouncement
	"Is the message triggered by any IRCInputMessageAnnouncements
	to which this connection has listened for."
	self sendMessage: (anInputAnnouncement message).