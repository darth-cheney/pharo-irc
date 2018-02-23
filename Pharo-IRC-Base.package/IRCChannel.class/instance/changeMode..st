irc-modes
changeMode: aModeString
	"Takes an incoming mode string,
	like '+am' or '-O', and makes the
	corresponding adjustments to the underlying
	mode set for the channel"
	(aModeString first = $+)
		ifTrue: [ ^ self addMode: (aModeString copyFrom: 2 to: (aModeString size)) ].
	(aModeString first = $-)
		ifTrue: [ ^ self removeMode: (aModeString copyFrom: 2 to: (aModeString size)) ].