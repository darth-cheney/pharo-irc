tests
testProcessNameReply
	"Test the ability of the connection
	to deal properly with a 353 RPL_NAMEREPLY
	message."
	| examples chanNames |
	examples := self parseExamples: (self class nameReplyExamples).
	
	"Setup the channels so they exist"
	chanNames := (examples collect: [ :ex | 
		ex arguments at: 3]) asSet.
	chanNames do: [ :name | conn addChannelNamed: name ].
	
	examples do: [ :message |
		"Ensure that these messages get to the appropriate channel"
		| chanName |
		conn processNameReply: message.
		"353s have the channel name at the third position"
		self assert: (message arguments size >= 3).
		chanName := (message arguments at: 3).
		self assert: (conn channels includesKey: chanName).
		self assert: (((conn channels at: chanName) messageLog) includes: message) ].