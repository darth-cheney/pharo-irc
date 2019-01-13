printing
printConnectionQuit: anIRCMessage
	"Print that you've quit the current connection"
	| text |
	text := (Character tab) asText.
	text := text,'You have quit' asText.
	anIRCMessage trailer ifNotNil: [ 
		text := (text,' with message: ' asText,(anIRCMessage trailer asText)) ].
	text := text,(String crlf) asText.
	text addAttributes: {TextEmphasis bold. TextEmphasis italic}.
	self addTextToLog: text.

	