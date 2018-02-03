initialization
receiveIRCAnnouncement: anAnnouncement
	| stream |
	stream := self textArea text writeStream.
	stream setToEnd.
	anAnnouncement messages do: [ :msg |
		stream
			nextPut: Character cr; 
			nextPutAll: (msg asString) ].
	self textArea text: (stream contents).