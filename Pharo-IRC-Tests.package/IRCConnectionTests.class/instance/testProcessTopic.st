tests
testProcessTopic
	"Test the connection's ability to handle
	331/332/333 IRCmessages, which correspond
	to topic information.
	Should route the messages to the appropriate
	channel, since this is a channel only message."
	| examples |
	examples := self parseExamples: self class topicMsgExamples.
	examples do: [ :message |
		| chanName |
		self assert: (message arguments size >= 2).
		chanName := message arguments at: 2.
		conn addChannelNamed: chanName.
		conn processTopic: message.
		self assert: ((conn channels at: chanName) messageLog includes: message) ].