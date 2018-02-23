announcer handling
listenForQuitAnnFrom: anAnnouncer
	anAnnouncer
		when: IRCQuitAnnouncement 
		send: #receiveQuitAnn:
		to: self