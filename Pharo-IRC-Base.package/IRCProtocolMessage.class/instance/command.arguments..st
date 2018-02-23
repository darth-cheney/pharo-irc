accessing
command: aCommand arguments: aCollection
	"Convenience function that sets the command
	and arguments collection but sets the trailer
	to nil."
	self
		command: aCommand
		arguments: aCollection
		trailer: nil.