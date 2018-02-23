tests
testProcessPart
	"Ensure the channel's ability to handle
	PART message, both those of the current user
	and others on the given channel. Should only
	announce a PART announcement in case of current
	user. Otherwise, remove the user from the channel,
	and announce both the message and a chaninfo update"
	| examples initUsers |
	examples := self parseExamples: self class partExamples.
	conn nickname: 'pharo-user'.

	"From the examples, add all of the users
	we find so we can test their removal"
	initUsers := examples collect: [ :msg |
		IRCUser nicknamed: (conn nickFromPrefix: msg) ].
	chan users addAll: initUsers.
	
	examples do: [ :message |
		| nick |
		nick := conn nickFromPrefix: message.
		self listenForChanInfoAnnFrom: chan privAnnouncer.
		self listenForMsgAnnFrom: chan privAnnouncer.
		self listenForPartAnnFrom: chan privAnnouncer.
		chan processPart: message.
		(nick = conn nickname)
			ifTrue: [ 
				self assert: (self receivedPartAnn isNotNil).
				self assert: (self receivedPartAnn message) equals: message.
				self assert: (self receivedPartAnn channel) equals: chan.
				self assert: (self receivedPartAnn user) equals: (conn user) ]
			ifFalse: [ 
				self deny: (chan hasUserNicknamed: nick).
				self assert: (self receivedMsgAnn isNotNil).
				self assert: (self receivedMsgAnn message) equals: message.
				self assert: (self receivedChanInfoAnn isNotNil).
				self assert: (self receivedChanInfoAnn channel) equals: chan ]. 
			self
				resetAnnouncers;
				resetChannel.
		]
	