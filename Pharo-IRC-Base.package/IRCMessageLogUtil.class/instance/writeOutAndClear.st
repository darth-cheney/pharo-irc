writing
writeOutAndClear
	| stream |
	stream := self logFile writeStream.
	stream upToEnd.
	self messages do: [ :msg |
		stream
			nextPutAll: (msg asString);
			nextPut: (Character lf) ].
	stream close.
	self messages removeAll.