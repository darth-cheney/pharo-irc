as yet unclassified
getConnectionCount
	"Respond with the total number of
	IRCConnection instances that are
	currently connected."
	^ (IRCConnection allInstances select: [ :inst | 
		inst isConnected ]) size.