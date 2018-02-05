accessing
channel: anIRCChannel
	| inst |
	inst := self new.
	inst
		addSubscriber: (anIRCChannel connection) on: #handleInputAnnouncement:;
		channelName: (anIRCChannel name);
		channel: anIRCChannel.
		anIRCChannel addSubscriber: inst on: #handleIncoming:.
		^ inst openWithSpec.