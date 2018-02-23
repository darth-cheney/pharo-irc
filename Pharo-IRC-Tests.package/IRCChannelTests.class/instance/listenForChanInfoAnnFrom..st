announcer handling
listenForChanInfoAnnFrom: anAnnouncer 
	anAnnouncer
		when: IRCChanInfoAnnouncement 
		send: #receiveChanInfoAnn:
		to: self