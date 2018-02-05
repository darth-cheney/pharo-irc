as yet unclassified
doNonCommandText: aText
	"Do something with text entered
	that was not a command. For the BasicInput,
	we ignore this. Subclasses like channel
	version should override."
	^ self