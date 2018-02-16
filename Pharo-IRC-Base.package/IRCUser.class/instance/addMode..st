irc-modes
addMode: aModeString
	"Will add each character of
	the passed string to the current
	user's mode"
	aModeString do: [ :char |
		mode add: char ].