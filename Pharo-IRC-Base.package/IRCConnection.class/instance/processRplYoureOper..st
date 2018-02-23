message-processing
processRplYoureOper: anIRCProtocolMessage 
	"Handle RPL_YOUREOPER (381) replies,
	which indicate a successful attempt for the
	connection user to become an IRC operator"
	self user changeMode: '+o'.
	announcer announce: (IRCMessageAnnouncement new message: anIRCProtocolMessage).