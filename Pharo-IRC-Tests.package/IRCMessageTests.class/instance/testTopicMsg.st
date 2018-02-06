tests
testTopicMsg
	"Tests for outbound and inbound
	TOPIC messages"
	| ex1 ex2 ex3 oddMsg |
	ex1 := ':WiZ!jto@tolsun.oulu.fi TOPIC #test :New topic'.
	ex2 := 'TOPIC #test :'.
	ex3 := 'TOPIC #test'.
	{ ex1. ex2. ex3 } do: [ :ex |
		| msg |
		msg := IRCProtocolMessage fromString: ex.
		self assert: (msg command = #TOPIC).
		self assert: (msg arguments size >= 1).
		self assert: ex = (msg asString) ].
	oddMsg := IRCProtocolMessage fromString: ex2.
	self assert: (oddMsg arguments size = 2).
	