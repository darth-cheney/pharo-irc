initialization
addSubscriber: anObject on: aSymbol
	"Adds the passed Object to the Announcer
	and will send it the specified Symbol.
	Note that if the symbol takes values,
	the Announcement itself will be passed."
	announcer when: IRCSystemMessageAnnouncement send: aSymbol to: anObject.