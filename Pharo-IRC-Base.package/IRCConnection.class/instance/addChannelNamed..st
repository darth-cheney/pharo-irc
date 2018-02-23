adding
addChannelNamed: aStringOrSymbol
	"Creates an new instance of IRCChannel
	and adds it to the receiver's channel list"
	| newChan |
	newChan := IRCChannel new.
	newChan
		name: aStringOrSymbol;
		connection: self.
	self addChannel: newChan.