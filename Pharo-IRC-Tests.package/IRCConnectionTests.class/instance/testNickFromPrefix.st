tests
testNickFromPrefix
	"Tests the ability to extract a nickname from a prefix,
	even if it includes all of the server/host information."
	| m1 m2 m3 |
	m1 := IRCProtocolMessage fromString: ':test-user!~hostname.verizon.something JOIN #test-channel'.
	m2 := IRCProtocolMessage fromString: ':test-user JOIN #test-channel'.
	m3 := IRCProtocolMessage fromString: 'JOIN #test-channel'.
	self assert: (conn nickFromPrefix: m1) equals: 'test-user'.
	self assert: (conn nickFromPrefix: m2) equals: 'test-user'.
	self assert: (conn nickFromPrefix: m3) equals: nil.