tests
testProcessPrivMsg
	"Tests the connection's ability to properly
	handle PRIVMSG messages from the server.
	There are two types:
	1. Messages to a whole channel
	2. Messages directly to the user.
	Ensure that (1) messages find their way to
	the appropriate channel, and (2) private
	messages direct to the user are announced on
	all channels, as well as in the main msg announcer"
	| examples initChannel |
	examples := self parseExamples: self class privMsgExamples.
	initChannel := IRCChannel connection: conn named: #initialTestChannel.
	conn addChannel: initChannel.
	examples do: [ :message |
		| chanName recipient |
		conn nickname: 'pharo-user'.
		recipient := message arguments first.
		self listenForMsgAnnFrom: conn privAnnouncer.
		(conn nickname = recipient)
			ifTrue: [ 
				"Then this is a direct private message"
				conn processPrivMsg: message.
				self assert: (self receivedMsgAnn isNotNil).
				self assert: (self receivedMsgAnn message) equals: message.
				self assert: ((conn channels at: #initialTestChannel) messageLog includes: message) ]
			ifFalse: [ 
				"Then this is a message to a channel"
				chanName := message arguments at: 1.
				conn addChannelNamed: chanName.
				conn processPrivMsg: message.
				self assert: ((conn channels at: chanName) messageLog includes: message).
				self assert: (self receivedMsgAnn isNil) ].
			self resetAnnouncers.
		].