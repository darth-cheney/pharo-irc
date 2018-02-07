printing
printUserQuit: anIRCMessage
	| text userName |
	userName := self channel connection nickFromPrefix: anIRCMessage.
	text := (Character tab) asText.
	text := text,(userName asText),(' has quit' asText).
	anIRCMessage trailer ifNotNil: [ 
		text := text,': ' asText,(anIRCMessage trailer asText) ].
	text := text,(String crlf) asText.
	text allBold allItalic.
	self addTextToLog: text