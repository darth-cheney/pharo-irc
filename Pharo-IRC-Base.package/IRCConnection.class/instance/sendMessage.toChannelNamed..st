as yet unclassified
sendMessage: anIRCMessage toChannelNamed: aChanName
	"Convenience message that will attempt to send
	the passed message to a channel with the passed name
	in the receiver's channel dictionary"
	| chan |
	chan := self channels at: aChanName.
	^ self sendMessage: anIRCMessage toChannel: chan.