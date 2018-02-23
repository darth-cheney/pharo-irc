irc-modes
modeForChanNamed: aChannelName ifAbsent: aBlock
	"Respond with the mode set for the user
	on the specified channel in chanModes.
	If there is no entry in the dict for
	the named channel, execute the block"
	^ chanModes at: aChannelName ifAbsent: aBlock.