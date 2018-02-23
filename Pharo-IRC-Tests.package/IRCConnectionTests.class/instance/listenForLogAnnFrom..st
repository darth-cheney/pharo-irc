announcer handling
listenForLogAnnFrom: anAnnouncer
	"Instructs the passed announcer to
	announce IRCLogMessageAnnouncement 
	to the receiver's #receiveLogAnn:
	message"
	anAnnouncer
		when: IRCLogMessageAnnouncement 
		send: #receiveLogAnn:
		to: self.