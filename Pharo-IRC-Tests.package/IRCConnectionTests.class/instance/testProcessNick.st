tests
testProcessNick
	"Ensure the connection's ability to
	deal with NICK messages. There are
	two kinds: one for the primary connection
	user, indicating a nick change, and one
	for other users, which should be forwarded
	to channels to deal with."
	| chan1 chan2 user1 user2 ex1 ex2 |
	conn nickname: 'pharo-user'.
	chan1 := IRCChannel connection: conn named: '#test1'.
	conn addChannel: chan1.
	chan2 := IRCChannel connection: conn named: '#test2'.
	conn addChannel: chan2.
	user1 := IRCUser nicknamed: 'old-name'.
	user2 := IRCUser nicknamed: 'shouldnt-change'.
	chan1 users addAll: { user1. user2 }.
	chan2 users add: user1.
	ex1 := IRCProtocolMessage fromString: ':old-name!jto@tolsun.oulu.fi NICK new-name'.
	ex2 := IRCProtocolMessage fromString: ':pharo-user!jto@tolsun.oulu.fi NICK pharo-irc-user'.
	
	"Message should be forwarded to both channels on which
	User1 is present. The channel itself should handle the nick change"
	conn processNick: ex1.
	self assert: (chan1 messageLog includes: ex1).
	self assert: (chan2 messageLog includes: ex1).
	self assert: (conn nickname = 'pharo-user').
	
	"Primary user should have his nickname changed"
	self listenForMsgAnnFrom: conn privAnnouncer.
	conn processNick: ex2.
	self assert: (conn nickname) equals: 'pharo-irc-user'.
	self assert: (self receivedMsgAnn isNotNil).
	self assert: (self receivedMsgAnn message) equals: ex2.
	
	
	