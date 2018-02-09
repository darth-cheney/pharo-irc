as yet unclassified
handleJoinChannel: anAnnouncement
	| newTab chanInput |
	newTab := TabModel new.
	chanInput := IRCBasicChannelInput new.
	chanInput
		addSubscriber: (anAnnouncement channel connection) on: #handleInputAnnouncement:;
		channelName: (anAnnouncement channel name);
		channel: (anAnnouncement channel).
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
	newTab
		label: (anAnnouncement channel name);
		contents: chanInput buildWithSpec.
	self channelTabs addTab: newTab.
	newTab selected: true.
	chanInput input textArea keyboardFocusChange: true.
	
	