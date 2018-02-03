initialization
sendMessage: anIRCProtocolMessage
	"Instead of sending directly, this method
	will add the given message to this
	connection's outQueue, which should be
	flushed with each run of the listen loop."
	outQueue add: anIRCProtocolMessage.
	msgLog add: anIRCProtocolMessage.