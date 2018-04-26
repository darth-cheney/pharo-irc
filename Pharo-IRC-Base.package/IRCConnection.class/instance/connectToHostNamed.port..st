initialization
connectToHostNamed: aHostname port: aPortNum
	"Binds a SocketStream instance to my 'connection'
	instance variable and attempts to make the handshake."
	| sock |
	sock := Socket new.
	connection := SocketStream on: sock.
	sock connectToHostNamed: aHostname port: aPortNum.
	self listen.