as yet unclassified
handleIncoming: messageAnnouncement
	| newString |
	newString := String streamContents: [ :stream |
		stream
			nextPutAll: (messageAnnouncement message asString);
			crlf ].
	self addTextToLog: (newString asText).
	