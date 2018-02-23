printing
printIncomingMsg: anIRCMessage
	"Add a formatted incoming PRIVMSG
	to the receiver's log"
	| userName |
	userName := anIRCMessage prefix.
	(userName includes: $!)
		ifTrue: [ 
			userName := (userName copyFrom: 1 to: (userName indexOf: $!) - 1) ].
	(anIRCMessage arguments first = (self channel connection nickname))
		ifTrue: [
			^ self 
				showPrivateMessage: (anIRCMessage trailer)
				fromUserNamed: userName ]. 
	self
		showChanMessage: (anIRCMessage trailer)
		fromUserNamed: userName.