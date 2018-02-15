testing
isOwnerOnChanNamed: aString
	"Responds true if the receiver
	is an owner on the specified channel.
	False in all other cases"
	| chanMode |
	chanMode := chanModes at: aString ifAbsent: [ ^ false ].
	^ chanMode includes: $q.