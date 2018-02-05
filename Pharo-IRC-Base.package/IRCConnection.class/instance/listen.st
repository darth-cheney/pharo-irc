initialization
listen
	"Begin listening for newlines on the SocketStream
	bound to `connection`. As long as the connection
	is alive, we send the incoming stream to the
	process: message."
	[ 
		self initialHandshake.
		[ self isConnected ] whileTrue: [ 
			self connection isDataAvailable ifTrue: [ self processNextLine ].
			self handleOutgoing.
			Processor yield. 
		]. 
		"TODO: Find some way to deal with data that is still
		on the Socket once we've terminated the connection"
	] forkAt: Processor lowestPriority named: 'Pharo IRC'.