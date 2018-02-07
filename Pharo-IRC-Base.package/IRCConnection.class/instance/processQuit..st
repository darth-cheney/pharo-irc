message-processing
processQuit: anIRCMessage
	"Respond to a QUIT message from
	the server. We should close the socket connection"

	| sender |
	"If the nickname in the message is the
	current user's, it means we've quit the
	whole connection"
	(self prefixIsNickname: anIRCMessage)
		ifTrue: [ ^ self quitWithMessage: anIRCMessage ].
	
	"Otherwise some other user has quit on some
	other channel(s). Find the channel(s) and distribute
	the message."
	sender := self nickFromPrefix: anIRCMessage.
	(self channels select: [ :chan |
		chan hasUserNicknamed: sender ]) do: [ :userChan |
		 	self sendMessage: anIRCMessage toChannel: userChan ].