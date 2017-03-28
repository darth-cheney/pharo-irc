testing
isConnected
	"Checks to see whether or not the stream is
	 connected".
	stream ifNil: [ ^ false ].
	^ stream isConnected