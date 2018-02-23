tests
testAddChannelNamed
	"Tests the connection's ability to
	create and add a new channel by name"
	| chan |
	conn addChannelNamed: '#test-channel'.
	self assert: (conn channels includesKey: '#test-channel').
	chan := (conn channels at: '#test-channel').
	self assert: (chan name) equals: '#test-channel'.
	self assert: (chan connection) equals: conn.
	
	