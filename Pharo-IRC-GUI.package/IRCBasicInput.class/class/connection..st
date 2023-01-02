accessing structure variables
connection: anIRCConnection
	| inst |
	inst := self new.
	inst
		addSubscriber: anIRCConnection on: #handleInputAnnouncement:;
		connection: anIRCConnection.
	anIRCConnection addSubscriber: inst on: #handleIncoming:.
	anIRCConnection privAnnouncer
		when: IRCJoinedChannelAnnouncement 
		send: #handleJoinChannel:
		to: inst.
	^ inst open.