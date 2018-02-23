announcer handling
listenForJoinAnnFrom: anAnnouncer
	anAnnouncer
		when: IRCJoinedChannelAnnouncement 
		send: #receiveJoinAnn:
		to: self.