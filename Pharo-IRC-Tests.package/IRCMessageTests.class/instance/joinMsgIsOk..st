as yet unclassified
joinMsgIsOk: aString
	"Tests whether or not an individual JOIN
	message passes specific tests"
	| msg protocols |
	msg := IRCProtocolMessage fromString: aString.
	protocols := #($# $&).
	self assert: (msg command = #JOIN).
	self assert: (msg arguments size >= 1).
	self assert: (msg trailer isNil).
	self assert: aString = (msg asString).
	((msg arguments first) = '0')
		ifFalse: [ 
			 self assert: (protocols includes: ((msg arguments at: 1) at: 1))].
	
	"If there are multiple channels for the first
	argument, make sure each starts with a valid
	protocol identifier"
	((msg arguments at: 1) includes: $,)
		ifTrue: [ 
			((msg arguments at: 1) splitOn: $ ) do: [ :arg |
				self assert: (protocols includes: (arg at: 1)) ] ].
	"If a key is listed (2nd argument), make sure
	it DOESNT use a protocol"
	(msg arguments size > 1) ifTrue: [ 
		((msg arguments at: 2) includes: $,)
			ifTrue: [ 
				((msg arguments at: 2) splitOn: $ ) do: [ :arg |
					self assert: (protocols includes: (arg at: 1)) not ] 
			] 
	].
		
	