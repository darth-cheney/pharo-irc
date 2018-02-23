initialization
testProcessJoin
	"Ensure the channel's ability to
	handle an incoming JOIN message.
	Should create a new user to add to
	the channel, add it, and announce
	both an IRCMessageAnnouncement and
	an IRCChanInfoAnnouncement from its
	announcer."
	| ex1 ex2 ex3 |
	ex1 := IRCProtocolMessage fromString: ':Jayflux!jayflux@moz-ib2k80.as43234.net JOIN :#test'.
	ex2 := IRCProtocolMessage fromString: ':darth-cheney!darth-chene@moz-tghr1v.fios.verizon.net JOIN :#tes'.
	ex3 := IRCProtocolMessage fromString: ':pharo-user!~pharo-irc@pool-71-167-39-107.nycmny.fios.verizon.net JOIN #not-test'.
	
	"Set the connetion's nick (to test exclusion)"
	conn nickname: 'pharo-user'.
	
	"Should have user and announce"
	self listenForMsgAnnFrom: chan privAnnouncer.
	self listenForChanInfoAnnFrom: chan privAnnouncer.
	chan processJoin: ex1.
	self assert: (chan hasUserNicknamed: 'Jayflux').
	self assert: (self receivedMsgAnn isNotNil).
	self assert: (self receivedMsgAnn message) equals: ex1.
	self assert: (self receivedChanInfoAnn isNotNil).
	self assert: (self receivedChanInfoAnn channel) equals: chan.
	self resetAnnouncers.
	
	"Should have user and announce"
	self listenForMsgAnnFrom: chan privAnnouncer.
	self listenForChanInfoAnnFrom: chan privAnnouncer.
	chan processJoin: ex2.
	self assert: (chan hasUserNicknamed: 'darth-cheney').
	self assert: (chan hasUserNicknamed: 'Jayflux').
	self assert: (self receivedMsgAnn isNotNil).
	self assert: (self receivedMsgAnn message) equals: ex2.
	self assert: (self receivedChanInfoAnn isNotNil).
	self assert: (self receivedChanInfoAnn channel) equals: chan.
	self resetAnnouncers.

	"Should not add user and should not announce
	message or chanInfo"
	self listenForMsgAnnFrom: chan privAnnouncer.
	self listenForChanInfoAnnFrom: chan privAnnouncer.
	chan processJoin: ex3.
	self assert: (chan hasUserNicknamed: 'Jayflux').
	self assert: (chan hasUserNicknamed: 'darth-cheney').
	self deny: (chan hasUserNicknamed: 'pharo-user').
	self assert: (self receivedMsgAnn isNil).
	self assert: (self receivedChanInfoAnn isNil).
	