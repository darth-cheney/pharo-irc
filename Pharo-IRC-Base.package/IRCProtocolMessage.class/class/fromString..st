instance creation
fromString: aMessageString
	"Initialize a new instance from a string,
	which will be parsed out into its 
	constituent message parts first."
	
	^ self new 
		initializeFromDictionary: (self extractPrefixAndCommandFrom: aMessageString)
		fromString: aMessageString.