accessing structure variables
connection: anIRCConnection
	| inst |
	inst := self new.
	inst
		addSubscriber: anIRCConnection on: #handleInputAnnouncement:.
	anIRCConnection addSubscriber: inst on: #handleIncoming:.
	^ inst openWithSpec.