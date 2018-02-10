tests
testJoinMsgInParse
	"Test the parsing of *inbound*
	JOIN messages, which are
	confirmations that a user has joined."
	| ex msg | 
	ex := ':WiZ!jto@tolsun.oulu.fi JOIN #Twilight_zone'.
	self joinMsgIsOk: ex.
	msg := IRCProtocolMessage fromString: ex.
	self assert: (msg prefix isNotNil).
	