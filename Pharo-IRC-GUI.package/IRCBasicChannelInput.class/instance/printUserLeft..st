printing
printUserLeft: anIRCMessage
	| user text |
	user := self channel connection nickFromPrefix: anIRCMessage.
	text := (Character tab asText).
	text := text,(user,' has left the channel' asText, (String crlf) asText).
	text := text allBold allItalic.
	self addTextToLog: text.