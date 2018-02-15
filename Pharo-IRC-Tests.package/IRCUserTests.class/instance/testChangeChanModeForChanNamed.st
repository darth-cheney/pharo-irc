tests
testChangeChanModeForChanNamed
	"Ensures that we can properly change
	the mode (as a character set) for a user
	on a specified channel"
	| ex1 ex2 ex3 ex4 |
	ex1 := IRCProtocolMessage fromString: ':server MODE +ox #test pharo-user'.
	ex2 := IRCProtocolMessage fromString: ':server MODE +p #test2 pharo-user'.
	ex3 := IRCProtocolMessage fromString: ':server@something MODE +owx #test pharo-user'.
	ex4 := IRCProtocolMessage fromString: ':sercer@something MODE -xw #test pharo-user'.
	chan addUser: user.
	
	"First, test the two underlying
	methods that are called to handle
	each situation"
	self testAddChanModeForChanNamed.
	self testRemoveChanModeForChanNamed.
	
	"Now make sure that the modes are set up properly by parsing
	the examples through the actuall message send"
	user changeChanMode: (ex1 arguments at: 1) forChanNamed: (ex1 arguments at: 2).
	self assert: ((user channelModes at: '#test') includesAll: 'ox').
	
	self should: [ user changeChanMode: (ex2 arguments first) forChanNamed: (ex2 arguments at: 2) ] raise: IRCUserNotInChannel.
	
	user changeChanMode: (ex3 arguments at: 1) forChanNamed: (ex3 arguments at: 2).
	self assert: ((user channelModes at: '#test') includesAll: 'owx').
	
	user changeChanMode: (ex4 arguments at: 1) forChanNamed: (ex4 arguments at: 2).
	self assert: ((user channelModes at: '#test') includes: $o).
	self deny: ((user channelModes at: '#test') includesAny: 'wx').