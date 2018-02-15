as yet unclassified
changeChanMode: aModeString forChanNamed: aChannelName
	"Attempts to change the modestring for the
	receiver on the given channel. If the user is
	not on the channel, we should raise an error."
	| modeChars |
	modeChars := aModeString copyFrom: 2 to: (aModeString size).
	(aModeString first = $+)
		ifTrue: [ ^ self 
						addChanMode: modeChars
						forChanNamed: aChannelName  ].
	(aModeString first = $-)
		ifTrue: [ ^ self
						removeChanMode: modeChars
						forChanNamed: aChannelName ].
					