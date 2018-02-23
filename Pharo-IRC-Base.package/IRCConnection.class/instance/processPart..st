message-processing
processPart: anIRCMessage
	"Handle all PART messages."
	| channelName chan |
	channelName := anIRCMessage arguments first.
	chan := self channels
					at: channelName
					ifAbsent: [ nil ].
	chan
		ifNotNil: [ 
			self sendMessage: anIRCMessage toChannel: chan ].
	
	(self prefixIsNickname: anIRCMessage)
		ifTrue: [ 
			self leaveChannel: chan.
			announcer announce:
				(IRCPartChannelAnnouncement new 
					message: anIRCMessage;
					user: self user;
					channel: chan) ].