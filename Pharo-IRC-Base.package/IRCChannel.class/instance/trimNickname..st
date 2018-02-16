as yet unclassified
trimNickname: aString
	"Responds with the true nickname of a user,
	without any mode symbols at the beginning.
	This removes the '@~' etc that you'd see in 
	a typical RPLY_NAMEREPLY"
	| readStream char |
	readStream := ReadStream on: aString.
	char := readStream next.
	[ char isAlphaNumeric ]
		whileFalse: [ char := readStream next ].
	^ (String streamContents: [ :s | 
		s
			nextPut: char;
			nextPutAll: readStream upToEnd]).