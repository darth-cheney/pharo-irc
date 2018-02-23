printing
printTopic: anIRCMessage
	"Prints the topic to the top of the channel
	in a specialized format, when the topic
	has been received."
	| text |
	text := (anIRCMessage trailer asText allBold),(String crlf) asText.
	text addAttribute: (TextColor color: (Color green)).
	text := ('[ ' asText, 'Topic' asText allBold,' ]:  ' asText),text.
	self addTextToLog: text.