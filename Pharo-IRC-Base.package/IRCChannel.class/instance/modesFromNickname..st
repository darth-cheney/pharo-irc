as yet unclassified
modesFromNickname: aString
	"Responds with the modes ('@~' etc)
	that often precede nicknames in a 
	RPL_NAMEREPLY response. Is the complement
	of #trimNickname"
	(aString first isAlphaNumeric)
		ifTrue: [ ^ aString ].
	^(String streamContents: [ :s |
		| readStream char |
		readStream := ReadStream on: aString.
		char := readStream next.
		[ char isAlphaNumeric ]
			whileFalse: [ 
				s nextPut: char.
				char := readStream next ].
		 ]).
	