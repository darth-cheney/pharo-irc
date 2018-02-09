tests
testAddChannel
	"Testing the ability of the Connection to
	respond to #addChannel. A channel object should
	be added to the internal channels dict."
	| chan |
	chan := IRCChannel connection: conn named: '#test-channel'.
	conn addChannel: chan.
	self assert: (conn channels at: '#test-channel') equals: chan.
	self assert: (chan connection) equals: conn.
	