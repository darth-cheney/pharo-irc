as yet unclassified
modeFromPrefixForUser: anIRCUser
	"For a given IRCUser on this channel,
	set the initial channel mode based on a symbol
	that appears at the first character of the
	user's current nickname. This is usually from
	a RPL_NAMEREPLY"
	| stream char |
	stream := ReadStream on: (anIRCUser nickname).
	char := stream next.
	[ char isAlphaNumeric ] whileFalse: [ 
		(anIRCUser class nonAlphaNickModes includesKey: char) ifTrue: [ 
			anIRCUser addChanMode: ((anIRCUser class nonAlphaNickModes at: char) asString) forChanNamed: (self name) ].
		char := stream next ].
	anIRCUser nickname: (String streamContents: [ :s | 
		s
			nextPut: char;
			nextPutAll: stream upToEnd]).