tests
testPartMsgInParse
	"Tests the parsing in inbound
	PART messages, which are notifications
	of users leaving a channel"
	| examples |
	examples := { 
	 ':WiZ!jto@tolsun.oulu.fi PART #playzone :I lost' }.
	examples do: [ :ex |
		| msg |
		msg := IRCProtocolMessage fromString: ex.
		self assert: (msg command = #PART).
		self assert: (msg arguments size >=1).
		self assert: ex = (msg asString).
		self assert: (msg trailer isNotNil) ].