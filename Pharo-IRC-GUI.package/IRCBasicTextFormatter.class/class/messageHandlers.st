as yet unclassified
messageHandlers
	^ MessageHandlers ifNil: [ 
		MessageHandlers := { 
			#PRIVMSG -> #formatPrivMsg: } asDictionary ].