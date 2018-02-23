as yet unclassified
sendMessage: anIRCMessage toChannel: anIRCChannel
	"Sends the incomingMessage: message to
	the specified channel object with the
	IRCMessage as the argument"
	anIRCChannel incomingMessage: anIRCMessage.