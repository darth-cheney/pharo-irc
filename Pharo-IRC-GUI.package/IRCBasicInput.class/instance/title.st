api
title
	self connection
		ifNotNil: [ 
			^ String streamContents: [ :s |
				s
					nextPutAll: (self connection nickname);
					nextPut: $@;
					nextPutAll: (self connection hostname);
					nextPut: $:;
					nextPutAll: (self connection port asString) ] ].
	^ 'Untitled'.