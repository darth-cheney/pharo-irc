testing
hasChanPrefix: aString
	"Returns true if the given string
	begins with a valid channel prefix."
	| valid |
	valid := #($# $& $!).
	^ (valid includes: (aString at: 1)).