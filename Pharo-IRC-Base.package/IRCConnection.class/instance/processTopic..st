message-processing
processTopic: anIRCMessage
	"Handle incoming messages that are the
	response of a topic for a given channel.
	331/332 responses are of format:
	<client> <channel> :<topic>"
	| channel chanName |
	chanName := anIRCMessage arguments second.
	channel := self channels
							at: chanName
							ifAbsent: [ nil ].
	channel ifNotNil: [ 
		self sendMessage: anIRCMessage toChannel: channel.
		^ self ].
	announcer announce: (IRCMessageAnnouncement new message: anIRCMessage).
	