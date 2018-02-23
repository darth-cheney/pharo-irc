formatting
formatPrivMsg: anIRCMessage
	| userName primaryUserColor |
	primaryUserColor := (Color r: 150 g: 150 b: 255 range: 255).
	userName := self connection nickFromPrefix: anIRCMessage.
	((anIRCMessage arguments first) = self connection nickname)
		ifTrue: [ ^ self formatPrivateMessage: anIRCMessage fromUserNamed: userName ].
	^ Text streamContents: [ :stream |
		stream
			nextPut: $<.
		(self connection prefixIsNickname: anIRCMessage)
			ifTrue: [ 
				stream
					nextPutAll: (userName asText addAttribute: (TextColor color: primaryUserColor)) ]
			ifFalse: [ 
				stream nextPutAll: userName asText ].
	stream
			nextPut: $>;
			nextPut: $ ;
			nextPutAll: anIRCMessage trailer asText;
			nextPutAll: (String crlf) asText ].
		