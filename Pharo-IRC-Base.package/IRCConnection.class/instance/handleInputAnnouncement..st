as yet unclassified
handleInputAnnouncement: anInputAnnouncement
	"Is the message triggered by any IRCInputMessageAnnouncements
	to which this connection has listened for."
	| msg |
	msg := anInputAnnouncement message.
	"(msg command = #NICK)
		ifTrue: [ self nickname: (msg arguments last) ]."
	self sendMessage: msg.