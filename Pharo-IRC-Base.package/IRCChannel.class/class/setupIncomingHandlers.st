as yet unclassified
setupIncomingHandlers
	"Respond with a Dicitonary mapping
	of IRC commands to selectors that will
	be used to fitler message actions on
	instances of this class"
	^ { 
		"When a user joins the chan"
		#JOIN -> #processJoin:.
		"When a user leaves a chan"
		#PART -> #processPart:.
		"When a user has quit"
		#QUIT -> #processQuit:.
		"Handle incoming NAMES response"
		'353' -> #processNames:.
		"Handle ENDOFNAMES"
		'366' -> #processNames:.
		 } asDictionary.
		