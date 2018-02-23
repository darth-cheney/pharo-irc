initialization
testHasUserNicknamed
	"Ensures that the channel can correctly identify
	when it contains a user with the given nickname."
	| user1 user2 |
	user1 := IRCUser nicknamed: 'user1'.
	user2 := IRCUser nicknamed: 'user2'.
	chan users add: user1.
	self assert: (chan hasUserNicknamed: 'user1').
	self deny: (chan hasUserNicknamed: 'user2').