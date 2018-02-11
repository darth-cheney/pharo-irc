tests
testChangeChanModeForChanNamed
	"Ensures that we can properly change
	the mode (as a character set) for a user
	on a specified channel"
	self testAddChanModeForChanNamed.
	self testRemoveChanModeForChanNamed.