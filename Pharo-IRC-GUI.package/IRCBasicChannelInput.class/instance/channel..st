accessing
channel: anIRCChannel
	chan := anIRCChannel.
	channelName := chan name.
	self users items: (anIRCChannel users).
	self connection: anIRCChannel connection.
	self commandHandler ifNotNil: [ 
		self commandHandler connection: anIRCChannel connection.
		self commandHandler channel: anIRCChannel ].