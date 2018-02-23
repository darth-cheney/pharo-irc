message-processing
processNameReply: anIRCMessage
	"Deal with:
	353 RPL_NAMEREPLY."
	| chan |
	chan := nil.
	anIRCMessage arguments do: [ :arg |
		| foundChan |
		foundChan := self channels at: arg ifAbsent: [ nil ].
		foundChan ifNotNil: [ chan := foundChan ].
	].
	chan ifNil: [ 
		^ announcer announce: (IRCMessageAnnouncement new message: anIRCMessage) ].
	self sendMessage: anIRCMessage toChannel: chan.
	
	
	