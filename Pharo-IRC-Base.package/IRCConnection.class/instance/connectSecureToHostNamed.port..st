initialization
connectSecureToHostNamed: aHostname port: aPortNum
	"Binds a SocketStream instance to my 'connection'
	instance variable and attempts to make the handshake.
	I will use TLS/SSL for the connection via Zodiac's
	ZdcSecureSocketStream rather than a regular socket stream."
	| sock |
	sock := Socket new.
	sock connectToHostNamed: aHostname port: aPortNum.
	connection := IRCSecureSocketStream on: sock.
	connection connect.
	self listen.