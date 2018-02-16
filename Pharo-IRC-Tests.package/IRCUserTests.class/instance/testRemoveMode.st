tests
testRemoveMode
	"Ensures the IRCUser's ability to
	remove a mode or modes from its
	(server) mode"
	user addMode: 'iws'.
	self assert: (user mode includesAll: 'iws').
	user removeMode: 'i'.
	self assert: (user mode includesAll: 'ws').
	self deny: (user mode includes: $i).
	user removeMode: 'ws'.
	self assert: (user mode isEmpty).