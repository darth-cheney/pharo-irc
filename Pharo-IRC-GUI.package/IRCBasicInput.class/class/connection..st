accessing structure variables
connection: anIRCConnection
	| inst |
	inst := self new.
	inst
		addSubscriber: anIRCConnection on: #handleInputAnnouncement:.
	anIRCConnection addSubscriber: inst on: #handleIncoming:.
	anIRCConnection privAnnouncer
		when: IRCJoinedChannelAnnouncement 
		send: #handleJoinChannel:
		to: inst.
	^ inst openWithSpec.