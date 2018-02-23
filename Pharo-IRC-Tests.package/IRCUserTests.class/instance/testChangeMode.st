tests
testChangeMode
	"Ensures that the IRCUser can handle
	an incoming mode change string and
	change its (server) mode accordingly"
	| ex1 ex2 ex3 |
	user nickname: 'pharo-user'.
	ex1 := '+iws'.
	ex2 := '-w'.
	ex3 := '-i'.
	user changeMode: ex1.
	self assert: (user mode includesAll: 'iws').
	user changeMode: ex2.
	self assert: (user mode includesAll: 'is').
	self deny: (user mode includes: $w).
	user changeMode: ex3.
	self assert: (user mode includes: $s).
	self deny: (user mode includesAny: 'iw').