as yet unclassified
rcvMsgAnnouncement: anAnnouncement
	"Handle the reception of a log message
	announcement. Add the message to the unique
	instnace log."
	self addMessage: (anAnnouncement message).