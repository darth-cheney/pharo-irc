tests
testServiceMsgParse
	"Test the parsing of the outbound
	SERVICE message. See RFC for more
	details."
	| ex msg |
	ex := 'SERVICE dict * *.fr 0 0 :French Dictionary'.
	msg := IRCProtocolMessage fromString: ex.
	self assert: (msg command = #SERVICE).
	self assert: (msg arguments size = 5).
	self assert: (msg prefix isNil).
	self assert: ex = (msg asString).