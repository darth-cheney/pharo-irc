initialization
testProcessNames
	"Ensure the channel's ability to handle
	incoming NAMES (353) response 
	messages, which are lists
	of users for the channel"
	| examples |
	examples := self parseExamples: self class nameReplyExamples.
	examples do: [ :message |
		| names channelNicks|
		names := message  trailer trimBoth splitOn: $ .
		self listenForChanInfoAnnFrom: chan privAnnouncer.
		self listenForMsgAnnFrom: chan privAnnouncer.
		chan processNames: message.
		channelNicks := chan users collect: [ :user |
			user nickname].
		self assert: (channelNicks includesAll: names).
		self assert: (self receivedChanInfoAnn isNotNil).
		self assert: (self receivedMsgAnn isNotNil).
		self assert: (self receivedChanInfoAnn channel) equals: chan.
		self assert: (self receivedMsgAnn message) equals: message.
		self
			resetAnnouncers;
			resetChannel.
	].
	