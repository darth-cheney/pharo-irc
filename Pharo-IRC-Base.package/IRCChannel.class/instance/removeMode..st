irc-modes
removeMode: 	aString
	"Removes each character (mode) of the
	passed string from the receiver's underlying
	mode set"
	aString do: [ :char |
		mode remove: char ifAbsent: [ nil ] ].