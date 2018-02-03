accessing
initializeFromDictionary: aDictionary fromString: aSourceString
	"We can initialize from a dictionary of
	message parts as parsed by the 
	IRCProtocolMessage class' extraction
	message."
	
	self initialize.
	rawString _ aSourceString.
	self prefix: (aDictionary at: #prefix).
	self command: (aDictionary at: #command).
	self arguments: (aDictionary at: #arguments).
	self trailer: (aDictionary at: #trailer).
	^ self.