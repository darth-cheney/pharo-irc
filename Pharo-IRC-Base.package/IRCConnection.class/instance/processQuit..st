message-processing
processQuit: anIRCMessage
	"Respond to a QUIT message from
	the server. We should close the socket connection"
	connection close.		
	announcer announce: (IRCMessageAnnouncement new message: anIRCMessage).