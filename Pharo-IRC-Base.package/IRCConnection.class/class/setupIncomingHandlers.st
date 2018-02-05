as yet unclassified
setupIncomingHandlers
	"Initializes a dictionary of
	incoming IRC commands that map to
	selectors for messages that should
	be sent to the connection in specific
	cases."
	^ { 
		"When a QUIT message comes in"
		#QUIT -> #processQuit:.
		"Handle a PING response"
		#PING -> #processPing:.
		"When a user (including the current)
		joins"
		#JOIN -> #processJoin:.
		"When a private message is sent,
		either to the user or to a specific
		channel".
		#PRIVMSG -> #processPrivMsg:.
		#NOTICE -> #processPrivMsg:.
		"Channel Topic Stuff"
		'331' -> #processTopic:.
		'332' -> #processTopic:.
		
		"NAMES reply"
		'353' -> #processNames:. } asDictionary.