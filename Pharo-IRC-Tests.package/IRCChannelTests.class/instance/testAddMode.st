tests
testAddMode
	"Tests the ability of the channel
	to add any mode(s) to its mode set"
	chan addMode: 'ami'.
	self assert: (chan mode includesAll: 'ami').
	