as yet unclassified
showChanMessage: aString fromUserNamed: aUsername
	"Put a channel recipient PRIVMSG on the
	receiver's text log in the appropriate format"
	| newText |
	newText := ('[ ' asText, aUsername asText allBold, ' ]: ' asText) asText.
	newText := newText,(aString asText),(String crlf asText).
	self addTextToLog: newText.