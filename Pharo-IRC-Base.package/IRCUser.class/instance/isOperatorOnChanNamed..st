testing
isOperatorOnChanNamed: aString
	"Responds true if the receiver user
	is an operator on the channel with the
	specified name. False in all other cases"
	| chanMode |
	chanMode := chanModes at: aString ifAbsent: [ ^ false ].
	^ chanMode includes: $o.