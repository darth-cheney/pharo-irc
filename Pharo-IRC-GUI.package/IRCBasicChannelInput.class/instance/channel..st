accessing
channel: anIRCChannel
	chan := anIRCChannel.
	channelName := chan name.
	self users items: (anIRCChannel users).
	self connection: anIRCChannel connection.