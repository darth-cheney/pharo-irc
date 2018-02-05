as yet unclassified
showPrivateMessage: aString fromUserNamed: aUsername
	| newText |
	newText := '[ ' asText,aUsername asText allBold, ' ]' asText.
	newText := newText,'[ ' asText,'private' asText allBold,']: ' asText.
	newText := newText,aString asText, (String crlf asText).
	self addTextToLog: (newText asText).