tests
testAddChanModeForChanNamed
	"Ensures that we can add any
	mode(s) (as character set) for
	a user on a specified channel."
	| ex1 ex2 |
	ex1 := IRCProtocolMessage fromString: ':server MODE +ox #test pharo-user'.
	ex2 := IRCProtocolMessage fromString: ':server MODE +p #test2 pharo-user'.
	chan addUser: user.
	
	"Case 1: Should successfully add the modes,
	because user is in the channel"
	user addChanMode: (ex1 arguments first) forChanNamed: (ex1 arguments at: 2).
	self assert: ((user modeForChanNamed: (ex1 arguments at: 2)) includesAll: #($o $x)).
	
	"Case 2: Should raise an IRCUserNotInChannel error, because
	the given user isn't in #test2"
	self should: [ user addChanMode: (ex2 arguments first) forChanNamed: (ex2 arguments at: 2) ] raise: IRCUserNotInChannel.