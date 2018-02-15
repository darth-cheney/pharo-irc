testing
isAdminOnChanNamed: aString
	"Responds true if the receiver
	is an admin on the named channel"
	| chanMode |
	chanMode := chanModes at: aString ifAbsent: [ ^ false ].
	^ chanMode includes: $a.