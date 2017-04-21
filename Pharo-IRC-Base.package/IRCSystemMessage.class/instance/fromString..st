instance creation
fromString: aString
	"Extract the parts of a message from a raw message string"
	| parts |
	rawMessage := aString.
	parts := IRCMessageParser extractPrefixAndCommandFrom: aString.
	prefix := parts at: #prefix.
	command := parts at: #command.
	arguments := parts at: #arguments.
	trailer := parts at: #trailer.
	
	