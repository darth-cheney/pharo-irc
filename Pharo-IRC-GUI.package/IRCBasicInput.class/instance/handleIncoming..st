as yet unclassified
handleIncoming: messageAnnouncement
	| validMessages newString |
	"(messageAnnouncement type = #incoming) ifFalse: [ ^ self ]."
	validMessages := self filterMessages: (messageAnnouncement messages).
	newString := String streamContents: [ :stream |
		validMessages do: [ :msg |
			stream
				nextPutAll: msg asString;
				crlf ]
			].
	self addTextToLog: (newString asText).
	
	