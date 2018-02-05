message-processing
processNames: anIRCMessage
	"Process a 353 names response message"
	| userNames |
	userNames := (anIRCMessage trailer splitOn: $ ) select: [ :aName |
		(aName = self connection nickname) not ].
	self users addAll: userNames.
	announcer announce: (IRCMessageAnnouncement new message: anIRCMessage).
	