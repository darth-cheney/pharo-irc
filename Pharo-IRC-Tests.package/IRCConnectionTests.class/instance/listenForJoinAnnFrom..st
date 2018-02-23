announcer handling
listenForJoinAnnFrom: anAnnouncer
	"Instructs the passed announcer to
	handle all IRCJoinedChanAnnouncement
	by sending #receiveJoinAnn: to the receiver"
	anAnnouncer
		when: IRCJoinedChannelAnnouncement
		send: #receiveJoinAnn:
		to: self