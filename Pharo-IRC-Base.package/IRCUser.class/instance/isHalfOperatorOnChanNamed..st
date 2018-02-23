testing
isHalfOperatorOnChanNamed: aString
	"Responds true if the receiver is
	a half-operator on the channel with
	the specified name. False in all other
	cases"
	| chanMode |
	chanMode := chanModes at: aString ifAbsent: [ ^ false ].
	^ chanMode includes: $h.
	