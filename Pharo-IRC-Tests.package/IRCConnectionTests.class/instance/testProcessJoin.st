tests
testProcessJoin
	"Tests the connection's ability to process
	an incoming JOIN message.
	There are two types: one corresponding
	to the main user, and those corresponding
	to other users on existing channels.
	We also need to see that the announcements work
	correctly."
	| examples|
	conn nickname: 'pharo-user'.
	self assert: conn nickname equals: 'pharo-user'.
	examples := (self parseExamples: self class joinMsgExamples).
	
	examples do: [ :msg |
		| chanName |
		chanName := nil.
		(msg arguments size >= 1)
			ifTrue: [ chanName := msg arguments at: 1 ]
			ifFalse: [ chanName := msg trailer ].
		self assert: chanName isNotNil.
		
		(conn prefixIsNickname: msg)
			"Message is a JOIN for the current user.
			 Ensure that the chan is created, added, 
			and that the announcement is made"
			ifTrue: [ 
				self listenForJoinAnnFrom: conn privAnnouncer.
				conn processJoin: msg.
				self assert: (conn channels includesKey: chanName).
				self assert: (self receivedJoinAnn isNotNil).
				self assert: (self receivedJoinAnn message) equals: msg.
				self assert: (self receivedJoinAnn channel name) equals: chanName.
			] 
			ifFalse: [ 
				"Is a JOIN for some other user on a channel.
				Only ensure the channel exists and the message
				was sent to it. IRCChannelTests can handle other
				cases."
				| chan |
				self assert: (conn channels includesKey: chanName).
				chan := conn channels at: chanName.
				self listenForJoinAnnFrom: chan privAnnouncer.
				conn processJoin: msg.
				self assert: (chan messageLog includes: msg).
			].
			self resetAnnouncers.
		].
	
	
	