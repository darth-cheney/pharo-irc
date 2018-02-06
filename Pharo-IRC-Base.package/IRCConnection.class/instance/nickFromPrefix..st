as yet unclassified
nickFromPrefix: anIRCMessage
	"Returns a parsed out nick or username
	from the prefix of a given IRCMessage"
	| name |
	anIRCMessage prefix ifNil: [ ^ nil ].
	name := anIRCMessage prefix.
	(name includes: $!)
		ifTrue: [ name := (name copyFrom: 1 to: (name indexOf: $!) - 1) ].
	^ name
	