as yet unclassified
command: aCommandString arguments: aCollection
	"Will create a new message instance with the
	command and arguments collection populated."
	^ self new
		command: aCommandString;
		arguments: aCollection;
		yourself.