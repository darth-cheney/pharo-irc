announcer handling
listenForPartAnnFrom: anAnnouncer
	anAnnouncer
		when: IRCPartChannelAnnouncement 
		send: #receivePartAnn:
		to: self