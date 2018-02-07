writing
writeOutAndClear
	| stream |
	stream := FileStream oldFileNamed: 'ircMsgLog.txt'.
	stream upToEnd.
	self messages do: [ :msg |
		stream
			nextPutAll: (msg asString);
			nextPut: (Character lf) ].
	stream close.
	self messages removeAll.