announcer handling
listenForPartAnnFrom: anAnnouncer
	"Instructs the passed announcer
	to send #receiveLeftAnn: to the
	receiver in cased of IRCLeftChannelAnnouncement"
	anAnnouncer
		when: IRCPartChannelAnnouncement 
		send: #receivePartAnn:
		to: self