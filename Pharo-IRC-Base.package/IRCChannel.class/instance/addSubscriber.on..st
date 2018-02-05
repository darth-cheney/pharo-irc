adding
addSubscriber: anObject on: aSymbol
	announcer
		when: IRCMessageAnnouncement
		send: aSymbol
		to: anObject.