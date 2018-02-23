printing
printNoTopic
	"Prints to channel that no topic
	has been set."
	| text |
	text := ('No topic set for ' asText),(self channelName asText).
	text := text allBold,(String crlf) asText.
	text addAttribute: (TextColor color: (Color green)).
	self addTextToLog: text.