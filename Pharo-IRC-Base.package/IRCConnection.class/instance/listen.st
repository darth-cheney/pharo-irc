as yet unclassified
listen
	"Forks a new process that listens for data on the open socket.
	 It completes once the socket disconnects."
	[ 
		[ self isConnected ] whileTrue: [ 
			self checkForIncoming.
			self broadcast.	
		]
	] fork.