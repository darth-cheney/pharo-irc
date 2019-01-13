printing
printTopicWho: anIRCMessage
	"Print information about which user
	set the current topic."
	| nickname timestamp text |
	nickname := anIRCMessage arguments at: 3.
	timestamp := anIRCMessage arguments at: 4.
	text := (Character tab) asText.
	text := text,'( ' asText,'Topic set by ' asText,nickname asText,' at ' asText,timestamp asText,') ' asText.
	text := text,(String crlf) asText.
	text addAttribute: (TextEmphasis italic).
	self addTextToLog: text.
	