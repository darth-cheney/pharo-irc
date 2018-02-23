initialization
isConnected
	"Check to see if the underlying
	SocketStream instance (referenced
	as 'connection') is still connected.
	If the connection was never set,
	we return False right away"
	self connection ifNil: [ ^ false ].
	^ self connection isConnected.