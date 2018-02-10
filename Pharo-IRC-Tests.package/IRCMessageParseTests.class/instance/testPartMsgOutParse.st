tests
testPartMsgOutParse
	"Test the parsing of outbound PART
	messages."
	| examples ops |
	ops := #($# $&).
	examples := { 
	 'PART #twilight_zone'.
	 'PART #oz-ops,&group5'}.
	examples do: [ :ex |
		| msg |
		msg := IRCProtocolMessage fromString: ex.
		self assert: (msg command = #PART).
		self assert: ex = (msg asString).
		self assert: (msg arguments size >= 1).
		self assert: (msg trailer isNil) ].