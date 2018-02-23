message-processing
processEndOfNames: anIRCMessage
	"Deal with:
	366 RPL_ENDOFNAMES
	Which is the message indicating the
	end of a names list."
	^ self
		sendMessage: anIRCMessage
		toChannelNamed: (anIRCMessage arguments last).