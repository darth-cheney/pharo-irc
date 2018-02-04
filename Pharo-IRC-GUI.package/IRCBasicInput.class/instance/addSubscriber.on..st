adding
addSubscriber: anObject on: aSymbol
	"For subscribing to announcements"
	ann when: IRCInputMessageAnnouncement send: aSymbol to: anObject.