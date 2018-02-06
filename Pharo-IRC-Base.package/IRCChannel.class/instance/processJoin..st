message-processing
processJoin: anIRCMessage
	"What to do when a new user joins"
	| userName |
	userName := anIRCMessage prefix.
	(userName includes: $!)
		ifTrue: [ userName := userName copyFrom: 1 to: (userName indexOf: $!) - 1 ].
	users add: (IRCUser nicknamed: userName).
	self announce: (IRCMessageAnnouncement new message: anIRCMessage).
	self announce: (IRCChanInfoAnnouncement new channel: self).