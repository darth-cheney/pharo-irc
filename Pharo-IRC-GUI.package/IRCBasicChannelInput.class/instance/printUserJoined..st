printing
printUserJoined: anIRCMessage
	| user text |
	user := self channel connection nickFromPrefix: anIRCMessage.
	text := (Character tab) asText.
	text := text,(user asText, ' has joined the channel' asText).
	text := (text allBold allItalic),((String crlf) asText).
	self addTextToLog: text.