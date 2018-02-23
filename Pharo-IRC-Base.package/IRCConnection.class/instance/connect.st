initialization
connect
	"Initialize the SocketStream using the stored
	values for hostname and port."
	self
		connectToHostNamed: hostname
		port: port.
