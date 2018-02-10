message-processing
processNames: anIRCMessage
	"Process a 353 names response message"
	| userNames |
	userNames := (anIRCMessage trailer trimBoth splitOn: $ ) select: [ :aName |
		(aName = self connection nickname) not ].
	userNames := userNames collect: [ :uname | 
		(IRCUser nicknamed: uname)].
	self users addAll: userNames.
	announcer announce: (IRCMessageAnnouncement new message: anIRCMessage).
	announcer announce: (IRCChanInfoAnnouncement new channel: self).
	