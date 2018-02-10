tests
testModeMsgParse
	"Paring of the OUTBOUND
	MODE message"
	| examples operators modes |
	operators := #($+ $-).
	modes := #($a $i $w $r $o $O $s).
	examples := { 
		'MODE WiZ -w'.
		'MODE Angel +i'.
		'MODE WiZ -o' }.
	examples do: [ :ex |
		| msg switch |
		msg := IRCProtocolMessage fromString: ex.
		self assert: (msg command = #MODE).
		self assert: (msg arguments size >= 2).
		switch := msg arguments at: 2.
		self assert: (msg prefix isNil).
		self assert: (msg trailer isNil).
		self assert: (ex = (msg asString)).
		self assert: (operators includes: (switch at: 1)).
	].