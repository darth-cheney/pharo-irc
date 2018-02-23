tests
testRemoveChanModeForChanNamed
	"Ensures the user's ability to remove a mode
	on a given channel"
	| ex1 ex2 |
	ex1 := IRCProtocolMessage fromString: ':server@something MODE +owx #test pharo-user'.
	ex2 := IRCProtocolMessage fromString: ':sercer@something MODE -xw #test pharo-user'.
	chan addUser: user.
	
	"First we add the modes for the user
	so we can remove them"
	user addChanMode: 'owx' forChanNamed: '#test'.
	user removeChanMode: 'wx' forChanNamed: '#test'.
	self assert: ((user modeForChanNamed: '#test') includes: $o).
	self deny: ((user modeForChanNamed: '#test') includesAll: 'wx').