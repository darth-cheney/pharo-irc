as yet unclassified
handleJoinChannel: anAnnouncement
	| newTab chanInput |
	chanInput := IRCBasicChannelInput new.
	chanInput
		addSubscriber: (anAnnouncement channel connection) on: #handleInputAnnouncement:;
		channelName: (anAnnouncement channel name);
		channel: (anAnnouncement channel);
		formatter: (IRCBasicTextFormatter new showOutbound: false).
	anAnnouncement channel
		addSubscriber: chanInput on: #handleIncoming:.
	(anAnnouncement channel privAnnouncer)
		when: IRCChanInfoAnnouncement
		send: #channelInfoUpdate:
		to: chanInput.
	(anAnnouncement channel privAnnouncer)
		when: IRCQuitAnnouncement
		send: #connectionQuit:
		to: chanInput.
	self channelTabs addPage: (SpNotebookPage title: (anAnnouncement channel name) provider: [ chanInput build ])..
	newTab selected: true.
	chanInput input textArea keyboardFocusChange: true.
	
	