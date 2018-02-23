tests
testProcessPart
	"Test the connection's ability to handle an
	incoming PART message. There are two types:
	one that references the connection's current
	user, and another that references some other
	user on a given channel.
	IRCChannelTests will deal with whether or
	not a non-primary user left some channel."
	| examples |
	conn nickname: 'pharo-user'.
	examples := self parseExamples: self class partMsgExamples.
	
	examples do: [ :message |
		| chanName chan |
		chanName := message arguments last.
		conn addChannelNamed: chanName.
		self assert: (conn channels includesKey: chanName).
		chan := (conn channels at: chanName).
		self listenForPartAnnFrom: conn privAnnouncer.
		
		self assert: (conn channels includesKey: chanName).
		conn processPart: message.
		self assert:	(chan messageLog includes: message).
		(conn prefixIsNickname: message)
			ifTrue: [ 
				self deny: (conn channels includesKey: chanName).
				self assert: (self receivedPartAnn isNotNil).
				self assert: (self receivedPartAnn message) equals: message.
				self assert: (self receivedPartAnn channel) equals: chan.
				self assert: (self receivedPartAnn user) equals: (conn user) ].
		].