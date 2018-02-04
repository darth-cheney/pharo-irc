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
			self handleIncoming.
			self handleOutgoing.
			Processor yield. 
		]. 
		self handleIncoming.
	] forkAt: Processor lowestPriority named: 'Pharo IRC'.