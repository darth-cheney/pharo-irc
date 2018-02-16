irc-modes
removeMode: aModeString
	"Will remove the given characters,
	corresponding to modes, from the user's
	current mode"
	aModeString do: [ :char | 
		mode remove: char ifAbsent: []].