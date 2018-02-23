tests
testProcessEndOfNames
	"Test the connection's ability to
	process 366 RPL_ENDOFNAMES.
	Should simply check to ensure that
	the message made it to the appropriate
	channels."
	| examples |
	examples := self parseExamples: (self class endOfNamesExamples).
	
	examples do: [ :message |
		| chanName |
		self assert: (message arguments size >= 1).
		chanName := message arguments last.
		conn channels at: chanName ifAbsent: [ 
			conn addChannelNamed: chanName ].
		conn processEndOfNames: message.
		self assert: ((conn channels at: chanName) messageLog includes: message) ].
	