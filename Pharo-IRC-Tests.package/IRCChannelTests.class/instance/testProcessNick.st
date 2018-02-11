tests
testProcessNick
	"Ensure the channel can deal with
	incoming NICK messages, which deal with
	nickname changes. Channels will receive all
	non-primary user nick messages, so they need to
	check if the user is even in the receiver's userlist"
	| ex1 ex2 user1 user2 |
	ex1 := IRCProtocolMessage fromString: ':old-name!jto@tolsun.oulu.fi NICK new-name'.
	ex2 := IRCProtocolMessage fromString: ':notinchannel!jto@tolsun.oulu.fi NICK stillnotinchannel'.
	user1 := IRCUser nicknamed: 'old-name'.
	user2 := IRCUser nicknamed: 'notinchannel'.
	chan users add: user1.
	self listenForChanInfoAnnFrom: chan privAnnouncer.
	self listenForMsgAnnFrom: chan privAnnouncer.
	
	"Case 1: Nick is in he channel and should be changed"
	chan processNick: ex1.
	self assert: (chan hasUserNicknamed: 'new-name').
	self deny: (chan hasUserNicknamed: 'old-name').
	self assert: (self receivedMsgAnn isNotNil).
	self assert: (self receivedMsgAnn message) equals: ex1.
	self assert: (self receivedChanInfoAnn isNotNil).
	self assert: (self receivedChanInfoAnn channel) equals: chan.
	self resetAnnouncers.
	
	"Case 2: Nick is not in this channel, so nothing
	should change and nothing should be announced from it"
	chan processNick: ex2.
	self deny: (chan hasUserNicknamed: 'notinchannel').
	self deny: (chan hasUserNicknamed: 'stillnotinchannel').
	self assert: (self receivedMsgAnn isNil).
	self assert: (self receivedChanInfoAnn isNil).
	