tests
testModeFromPrefixForUser
	"Ensures that a channel can properly respond
	to the symbols that are the first character in
	RPL_NAMEREPLY messages for users with special modes
	on the channel."
	| ex1 ex2 ex3 ex4 ex5 |
	ex1 := IRCUser nicknamed: '+voiced-user'.
	ex2 := IRCUser nicknamed: '@op-user'.
	ex3 := IRCUser nicknamed: '&admin-user'.
	ex4 := IRCUser nicknamed: '%halfop-user'.
	ex5 := IRCUser nicknamed: '@+~multi-user'.
	
	chan users add: ex1.
	ex1 channelModes at: (chan name) put: Set new.
	chan modeFromPrefixForUser: ex1.
	self assert: ((ex1 channelModes at: '#test') includes: $v).
	self assert: (ex1 nickname) equals: 'voiced-user'.
	self assert: (ex1 isVoicedOnChanNamed: (chan name)).
	
	chan users add: ex2.
	ex2 channelModes at: (chan name) put: Set new.
	chan modeFromPrefixForUser: ex2.
	self assert: ((ex2 channelModes at: '#test') includes: $o).
	self assert: (ex2 nickname) equals: 'op-user'.
	self assert: (ex2 isOperatorOnChanNamed: (chan name)).
	
	chan users add: ex3.
	ex3 channelModes at: (chan name) put: Set new.
	chan modeFromPrefixForUser: ex3.
	self assert: ((ex3 channelModes at: '#test') includes: $a).
	self assert: (ex3 nickname) equals: 'admin-user'.
	self assert: (ex3 isAdminOnChanNamed: (chan name)).
	
	chan users add: ex4.
	ex4 channelModes at: (chan name) put: Set new.
	chan modeFromPrefixForUser: ex4.
	self assert: ((ex4 channelModes at: '#test') includes: $h). 
	self assert: (ex4 isHalfOperatorOnChanNamed: (chan name)).
	
	chan users add: ex5.
	ex5 channelModes at: (chan name) put: Set new.
	chan modeFromPrefixForUser: ex5.
	self assert: ((ex5 channelModes at: '#test') includesAll: 'oqv').
	self assert: (ex5 nickname) equals: 'multi-user'.
	self assert: (ex5 isOperatorOnChanNamed: (chan name)).
	self assert: (ex5 isVoicedOnChanNamed: (chan name)).
	self assert: (ex5 isOwnerOnChanNamed: (chan name)).