tests
testProcessPing
	"Test the connection's ability to process
	incoming PING messages from the server"
	| examples |
	examples := self parseExamples: self class pingMsgExamples.
	examples do: [ :message |
		| resp |
		self listenForMsgAnnFrom: conn privAnnouncer.
		conn processPing: message.
		resp := conn privOutQueue last.
		(1 to: (resp arguments size)) do: [ :num |
			self assert: (resp arguments at: num) equals: (message arguments at: num) ].
		self assert: (resp trailer) equals: (message trailer).
		self assert: (resp command) equals: #PONG.
		self assert: (self receivedMsgAnn isNotNil).
		self assert: (self receivedMsgAnn message) equals: message.
	].