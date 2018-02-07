accessing
connection: anIRCConnection
	| newTab |
	newTab := TabModel new.
	connection := anIRCConnection.
	self serverLog 
		connection: anIRCConnection;
		addSubscriber: anIRCConnection on: #handleInputAnnouncement:.
	anIRCConnection
		addSubscriber: (self serverLog) on: #handleIncoming:.
	anIRCConnection privAnnouncer
		when: IRCJoinedChannelAnnouncement
		send: #handleJoinChannel:
		to: self.
	newTab
		label: (anIRCConnection hostname);
		contents: (self serverLog buildWithSpec).
	self channelTabs addTab: newTab.