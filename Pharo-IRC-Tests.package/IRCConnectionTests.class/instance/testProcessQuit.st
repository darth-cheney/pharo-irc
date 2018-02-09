tests
testProcessQuit
	"Tests the connection's ability to handle
	QUIT messages from the server. There are
	two types:
	1. The connection's user has quit;
	2. Some user in one or more channels
	has quit.
	Ensure that (1) user quits quit
	the connection properly (with announcement), 
	and (2) other user quits
	are sent to all channels."
	| examples allUserNames |
	examples := self parseExamples: self class quitMsgExamples.
	conn nickname: 'pharo-user'.
	
	"We need to create IRCUsers for each of
	the prefixes in the example messages"
	allUserNames := (examples collect: [ :msg |
		(conn nickFromPrefix: msg) ]) asSet.
	allUserNames := allUserNames collect: [ :name |
		IRCUser nicknamed: name ].

	
	"Create some example channels
	and add all users to all of them"
	examples do: [ :message |
		self createChannelsWithUsers: allUserNames.
		self listenForQuitAnnFrom: conn privAnnouncer.
		conn processQuit: message.
		(conn prefixIsNickname: message)
			ifTrue: [
				"Then the main user has quit. Check
				to ensure the connection has been severed etc"
				self deny: conn isConnected.
				self assert: (conn channels size) equals: 0.
				self assert: (self receivedQuitAnn isNotNil).
				self assert: (self receivedQuitAnn message) equals: message.]
			ifFalse: [
				"Then some user on some channel has quit.
				Ensure we've sent the message to all channels"
				self assert: (conn channels size) equals: 10.
				conn channels valuesDo: [ :chan | 
					self assert: (chan messageLog includes: message)].
			].
	].