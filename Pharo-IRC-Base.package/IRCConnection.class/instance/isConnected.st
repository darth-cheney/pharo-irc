testing
isConnected
	"Returns whether or not the underlying SocketStream connection is open"
	stream ifNil: [ ^ false ].
	^ stream isConnected.