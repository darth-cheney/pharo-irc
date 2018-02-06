as yet unclassified
showPrivateMessage: aString fromUserNamed: aUsername
	| newText |
	newText := (aUsername asText allBold).
	newText addAttribute: (TextColor color: (Color red)).
	newText := '[ ' asText,newText, ' ]' asText.
	newText := newText,'[ ' asText,'private' asText allBold,']: ' asText.
	newText := newText,aString asText, (String crlf asText).
	self addTextToLog: (newText asText).