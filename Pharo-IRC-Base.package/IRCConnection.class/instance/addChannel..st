adding
addChannel: anIRCChannel
	self channels at: (anIRCChannel name asSymbol) put: anIRCChannel.
	announcer announce: (IRCJoinedChannelAnnouncement new channel: anIRCChannel).