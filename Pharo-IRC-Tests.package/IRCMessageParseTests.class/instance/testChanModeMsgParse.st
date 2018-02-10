tests
testChanModeMsgParse
	"Test the parsing of MODE commands
	that are channel-specific."
	| examples |
	examples := { 
		'MODE #Finnish +imI *!*@*.fi'.
		'MODE #Finnish +o Kilroy'.
		'MODE #Finnish +v Wiz'.
		'MODE #Fins -s'.
		'MODE #42 +k oulu'.
		'MODE #42 -k oulu'.
		'MODE #eu-opers +l 10'.
		':WiZ!jto@tolsun.oulu.fi MODE #eu-opers -l'.
		'MODE &oulu +b'.
		'MODE &oulu +b *!*@*'.
		'MODE &oulu +b *!*@*.edu +e *!*@*.bu.edu'.
		'MODE #bu +be *!*@*.edu *!*@*.bu.edu'.
		'MODE #meditation e'.
		'MODE #meditation I'.
		'MODE !12345ircd O' }.
	examples do: [ :ex |
		| msg |
		msg := IRCProtocolMessage fromString: ex.
		self assert: (msg command = #MODE).
		self assert: (msg arguments size >= 1).
		self assert: (self hasChanPrefix: (msg arguments first)).
		self assert: ex = (msg asString).
	 ].