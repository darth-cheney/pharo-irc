tests
getUniqueChanNamesFrom: aCollection
	"Responds with a collection of unique
	channel names as extracted from a collection
	of rawString versions of IRC messages."
	^ (aCollection collect: [ :text |
		 IRCProtocolMessage fromString: text ]) asSet.
	