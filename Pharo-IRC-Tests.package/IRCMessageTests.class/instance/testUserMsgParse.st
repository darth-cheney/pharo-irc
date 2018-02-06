tests
testUserMsgParse
	"Test the parsing of USER
	messages. These are outbound
	messages only."
	| examples |
	examples := { 
		'USER guest 0 * :Ronnie Reagan'.
		'USER guest 8 * :Ronnie Reagan' }.
	examples do: [ :ex |
		| msg |
		msg := IRCProtocolMessage fromString: ex.
		self assert: (msg command = #USER).
		self assert: (msg arguments size = 3).
		self assert: (msg trailer isNotNil).
		self assert: ex = (msg asString) ].