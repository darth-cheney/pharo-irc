initailize-release
sendMessage: anIRCSystemMessage
	"Puts the message object into the outgoing message queue.
	 Note that the listen method will handle announcing changes
	 to each queue."
	outgoingQueue add: anIRCSystemMessage.