connection open/close
disconnect
	"Closes the underlying SocketStream, if present."
	stream ifNotNil: [ stream close ].