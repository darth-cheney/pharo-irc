formatting
formatPrivateMessage: anIRCMessage fromUserNamed: userName
	"Responds with formatting for a true
	private message (user to user) rather than
	a user to a channel"
	| userColor |
	userColor := TextColor red.
	^ Text streamContents: [ :stream |
		stream
			nextPut: $<;
			nextPutAll: ((userName asText) addAttribute: userColor);
			nextPut: $>;
			nextPutAll: '(private)' asText;
			nextPut: $ ;
			nextPutAll: (anIRCMessage trailer asText);
			nextPutAll: (String crlf) asText ].