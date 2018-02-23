announcer handling
listenForMsgAnnFrom: anAnnouncer
	anAnnouncer
		when: IRCMessageAnnouncement 
		send: #receiveMsgAnn:
		to: self