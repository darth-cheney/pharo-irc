formatting
formatOutboundMessage: anIRCMessage
	| txtColor |
	txtColor := TextColor color: (Color orange).
	^ Text streamContents: [ :stream |
		stream
			nextPutAll: '[Outbound]';
			nextPut: $[;
			nextPutAll: ((anIRCMessage command asText) addAttribute: txtColor);
			nextPut: $];
			nextPut: $ .
		(anIRCMessage prefix)
			ifNotNil: [
				stream 
					nextPut: $<;
					nextPutAll: (anIRCMessage prefix asText);
					nextPut: $>;
					nextPut: $ ].
		anIRCMessage arguments ifNotEmpty: [ 
			stream
				nextPut: $(;
				nextPutAll: (' ' join: (anIRCMessage arguments));
				nextPut: $);
				nextPut: $ .  ].
		(anIRCMessage trailer)
			ifNotNil: [ 
				stream nextPutAll: (anIRCMessage trailer asText) ]. 
		stream nextPutAll: (String crlf) asText.
	].