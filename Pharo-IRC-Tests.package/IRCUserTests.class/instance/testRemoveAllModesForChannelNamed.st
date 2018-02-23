tests
testRemoveAllModesForChannelNamed
	"Ensures that a given IRCUser can remove
	a reference to a channel from its chanModes
	dictionary"
	| ex1 ex2 |
	ex1 := IRCProtocolMessage fromString: ':server MODE +owxzf #test pharo-user'.
	ex2 := IRCProtocolMessage fromString: ':server MODE -f #test pharo-user'.
	chan addUser: user.
	
	self assert: (user channelModes includesKey: '#test').
	user removeAllModesForChannelNamed: '#test'.
	self deny: (user channelModes includesKey: '#test').