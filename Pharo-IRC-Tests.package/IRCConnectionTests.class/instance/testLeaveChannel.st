tests
testLeaveChannel
	"Tests the connection's ability to have the user
	leave a channel"
	conn addChannelNamed: '#test-channel'.
	conn leaveChannel: (conn channels at: '#test-channel').
	self assert: (conn channels includesKey: '#test-channel') not.