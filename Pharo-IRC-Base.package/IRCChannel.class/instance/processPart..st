message-processing
processPart: anIRCMessage
	"Handle all part messages.
	You will want to know if the message concerns the
	current user or not."
	| foundName |
	(self connection prefixIsNickname: anIRCMessage)
		ifTrue: [ 
			self connection leaveChannel: self.
			^ announcer announce: (IRCLeftChannelAnnouncement new 
											channel: self;
											message: anIRCMessage;
											user: self connection user) ].
	foundName := self connection nickFromPrefix: anIRCMessage.
	self users removeAll: (self users select: [ :user |
		(user nickname) = foundName ]).
	announcer announce: (IRCMessageAnnouncement new message: anIRCMessage).
	announcer announce: (IRCChanInfoAnnouncement new channel: self).