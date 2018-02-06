as yet unclassified
prefixIsNickname: anIRCMessage
	"Returns true if the prefix on
	a given message contains the connection's
	current nickname."
	| name |
	name := self nickFromPrefix: anIRCMessage.
	^ (name = self nickname).
	