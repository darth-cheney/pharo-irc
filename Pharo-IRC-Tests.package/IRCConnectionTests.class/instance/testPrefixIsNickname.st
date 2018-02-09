tests
testPrefixIsNickname
	"Tests whether or not the prefix of a given message
	contains a nickname that corresponds to the current
	connection's main user."
	| m1 m2 m3 |
	m1 := IRCProtocolMessage fromString: ':test-user!~verizon.cc.net PRIVMSG #test-channel :sup'.
	m2 := IRCProtocolMessage fromString: ':test-user PRIVMSG #test-channel :sup'.
	m3 := IRCProtocolMessage fromString: ':some-other-user PRIVMSG #test-channel :hey there'.
	conn nickname: 'test-user'.
	self assert: (conn prefixIsNickname: m1).
	self assert: (conn prefixIsNickname: m2).
	self deny: (conn prefixIsNickname: m3).
	