initialization
connectToHostNamed: aHostname port: aPortNum
	"Binds a SocketStream instance to my 'connection'
	instance variable and attempts to make the handshake."
	
	connection := SocketStream openConnectionToHostNamed: aHostname port: aPortNum.
	self listen.