irc-modes
changeMode: aModeString
	"Takes an incoming mode change
	string (+r or -io, for example)
	and appropriately updates the
	current user's mode."
	(aModeString first = $+)
		ifTrue: [ self addMode: (aModeString copyFrom: 2 to: (aModeString size)) ].
	(aModeString first = $-)
		ifTrue: [ self removeMode: (aModeString copyFrom: 2 to: (aModeString size)) ].