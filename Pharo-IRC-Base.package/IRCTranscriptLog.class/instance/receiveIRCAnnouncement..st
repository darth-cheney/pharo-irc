initialization
receiveIRCAnnouncement: anAnnouncement
	| newString |
	newString := String streamContents: [ :stream |
		stream
			nextPutAll: (self textArea text).
		anAnnouncement messages do: [ :msg |
			stream
				nextPutAll: msg asString;
				crlf ] ].
	self textArea text: newString.