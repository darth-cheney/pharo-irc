parsing
parseExamples: aCollection
	"Takes a collection of lines of IRC
	compliant message text and responds with
	a collection of instantiated IRCProtocolMessages"
	^ aCollection collect: [ :string |
		IRCProtocolMessage fromString: string ].