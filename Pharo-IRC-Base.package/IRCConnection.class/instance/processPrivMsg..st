message-processing
processPrivMsg: anIRCMessage
	"Handle all cases of PRIVMSG or NOTICE.
	These include channel specifc
	as well as messages that should appear
	across ALL channels.
	This code is borrowed liberally from
	squIRC"
	| channel recipient sender |
	sender := anIRCMessage prefix.
	recipient := anIRCMessage arguments first.
	channel := channels at: recipient ifAbsent: [ nil ].
	channel
		ifNotNil: [ 
			^ self sendMessage: anIRCMessage toChannel: channel ].
	(recipient asLowercase = self nickname asLowercase
		or: [ sender isNil ])
			ifTrue: [ self sendMessageToAllChans: anIRCMessage ].