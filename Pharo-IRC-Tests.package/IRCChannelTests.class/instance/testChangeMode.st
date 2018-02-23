tests
testChangeMode
	"Ensures the Channel's ability to
	take an incoming mode string (with + or -
	operators) and alter its underlying mode
	set accordingly"
	| ex1 ex2 ex3 |
	ex1 := '+amnit'.
	ex2 := '-ant'.
	ex3 := '+t'.
	chan changeMode: ex1.
	self assert: (chan mode includesAll: 'amnit').
	chan changeMode: ex2.
	self assert: (chan mode includesAll: 'mi').
	self deny: (chan mode includesAny: 'ant').
	chan changeMode: ex3.
	self assert: (chan mode includesAll: 'tmi').
	self deny: (chan mode includesAny: 'an').