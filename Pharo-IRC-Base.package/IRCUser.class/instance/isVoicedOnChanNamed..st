testing
isVoicedOnChanNamed: aString
	"Responds true if the receiver
	is voiced on the specified channel.
	False in all other cases"
	| chanMode |
	chanMode := chanModes at: aString ifAbsent: [ ^ false ].
	^ chanMode includes: $v.