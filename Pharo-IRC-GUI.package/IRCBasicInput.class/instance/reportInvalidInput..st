as yet unclassified
reportInvalidInput: aText
	| err |
	err := '[ ' asText, 'Invalid Input' asText allBold, ' ]: ' asText.
	self addTextToLog: ((err, aText) asText), String crlf asText.