announcer handling
listenForMsgAnnFrom: anAnnouncer
	"Tells the passed in announcer to
	send all IRCMessageAnnouncement calls
	to the receiver's #receiveMsgAnn: message"
	anAnnouncer
		when: IRCMessageAnnouncement
		send: #receiveMsgAnn:
		to: self.