formatting
formatDefault: anIRCMessage
	"We simply display the command in square brackets
	followed by the arguments, if any, in parents and the
	trailer at the end. If the message is an error response,
	we make the command part red."
	| cmdColor |
	cmdColor := TextColor green.
	anIRCMessage isError
		ifTrue: [ cmdColor := TextColor red ].
	^ Text streamContents: [ :stream |
		stream
			nextPut: $[;
			nextPutAll: ((anIRCMessage command asText) addAttribute: cmdColor);
			nextPutAll: '] ' asText.
		(anIRCMessage arguments size > 0)
			ifTrue: [ 
				stream
					nextPut: $(;
					nextPutAll: (' ' join: anIRCMessage arguments);
					nextPutAll: ') ' ].
		(anIRCMessage trailer)
			ifNotNil: [ 
				stream nextPutAll: (anIRCMessage trailer asText) ].
		stream
			nextPutAll: (String crlf) asText ].
	