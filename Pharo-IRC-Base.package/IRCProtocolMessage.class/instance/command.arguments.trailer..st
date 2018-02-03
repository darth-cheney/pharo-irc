accessing
command: aCommandString arguments: aCollection trailer: aTrailerString
	"Convenience function that sets new
	message parts all at once."
	self
		command: aCommandString;
		arguments: aCollection;
		trailer: aTrailerString.