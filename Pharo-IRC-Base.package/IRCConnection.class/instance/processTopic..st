message-processing
processTopic: anIRCMessage
	"Handle incoming messages that are the
	response of a topic for a given channel"
	| channel chanName |
	chanName := anIRCMessage arguments first.
	channel := self class incomingHandlers
									at: chanName
									ifAbsent: [ nil ].
	channel ifNotNil: [ 
		self sendMessage: anIRCMessage toChannel: channel.
		^ self ].
	