tests
testRemoveMode
	"Ensures the Channel's ability to remove
	mode(s) from its underlying modeset based
	on a passed in mode string, without + or -"
	chan addMode: 'amin'.
	self assert: (chan mode includesAll: 'amin').
	chan removeMode: 'a'.
	self deny: (chan mode includes: $a).
	chan removeMode: 'mn'.
	self assert: (chan mode includes: $i).
	self deny: (chan mode includesAny: 'amn').