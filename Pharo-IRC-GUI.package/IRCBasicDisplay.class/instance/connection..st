accessing
connection: anIRCConnection

	connection := anIRCConnection.
	self serverLog
		connection: anIRCConnection;
		addSubscriber: anIRCConnection on: #handleInputAnnouncement:;
		commandHandler:
			(IRCTextCommandHandler new connection: anIRCConnection).
	anIRCConnection addSubscriber: self serverLog on: #handleIncoming:.
	anIRCConnection privAnnouncer
		when: IRCJoinedChannelAnnouncement
		send: #handleJoinChannel:
		to: self.
	self channelTabs addPage: (SpNotebookPage
			 title: anIRCConnection hostname
			 provider: [ self serverLog ])