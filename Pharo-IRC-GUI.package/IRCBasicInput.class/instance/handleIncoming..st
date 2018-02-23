as yet unclassified
handleIncoming: messageAnnouncement
	| newText |
	"| newString |
	newString := String streamContents: [ :stream |
		stream
			nextPutAll: (messageAnnouncement message asString);
			crlf ]."
	newText := formatter formatMessage: (messageAnnouncement message).
	self addTextToLog: newText.
	