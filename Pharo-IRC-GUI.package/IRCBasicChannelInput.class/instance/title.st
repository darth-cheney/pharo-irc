api
title
	self channel
		ifNil: [ ^ self channelName ].
	^ String streamContents: [ :s |
		s
			nextPutAll: (self channel connection nickname);
			nextPut: $@;
			nextPutAll: (self channelName) ].