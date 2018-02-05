message-processing
processNames: anIRCMessage
	"Deal with a 353 NAMES reply list."
	| chan |
	chan := nil.
	anIRCMessage arguments do: [ :arg |
		| foundChan |
		foundChan := self channels at: arg ifAbsent: [ nil ].
		foundChan ifNotNil: [ chan := foundChan ].
	].
	chan ifNil: [ 
		^ announcer announce: (IRCMessageAnnouncement new message: anIRCMessage) ].
	chan incomingMessage: anIRCMessage.
	
	
	