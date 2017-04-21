as yet unclassified
command: aCommand arguments: aCollection
	"Composes a new message instance based on a passed command
	 (usually a symbol) and a collection of argument strings".
	^ (self new 
			command: aCommand;
			arguments: aCollection).
	