message-processing
processJoin: anIRCMessage
	"What to do when a new user joins"
	| userName |
	userName := self connection nickFromPrefix: anIRCMessage.
	(userName = self connection nickname)
		ifFalse: [ 
			 users add: (IRCUser nicknamed: userName).
	self announce: (IRCMessageAnnouncement new message: anIRCMessage).
	self announce: (IRCChanInfoAnnouncement new channel: self)].
