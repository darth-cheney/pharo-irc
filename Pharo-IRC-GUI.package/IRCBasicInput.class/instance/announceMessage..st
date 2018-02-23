as yet unclassified
announceMessage: anIRCMessage
	"Send the message to any subscribers via
	the announcer. Usually we want any listening
	IRCConnection objects to just send the thing."
	ann announce: (IRCInputMessageAnnouncement new message: anIRCMessage).