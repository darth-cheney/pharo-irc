message-processing
processNick: anIRCProtocolMessage 

	(self prefixIsNickname: anIRCProtocolMessage)
		ifTrue: [  
			"Sometimes the new nick is in the trailer"
			(anIRCProtocolMessage arguments size >= 1)
				ifTrue: [ self nickname: (anIRCProtocolMessage arguments last) ]
				ifFalse: [ self nickname: (anIRCProtocolMessage trailer) ].
			^ announcer announce: (IRCMessageAnnouncement new message: anIRCProtocolMessage).
		].
	^ self sendMessageToAllChans: anIRCProtocolMessage.