as yet unclassified
processIncoming: anIRCMessage
	"Deal with handling an incoming irc message.
	This exists separately from handleIncoming:
	so that we can re-write messages from the
	channel log."
	| newString |
	"(anIRCMessage command = 'PRIVMSG')
		ifTrue: [ 
			self printIncomingMsg: anIRCMessage.
			^ self ]."
	(anIRCMessage command = #PART)
		ifTrue: [ 
			self printUserLeft: anIRCMessage.
			^ self ].
	(anIRCMessage command = #JOIN)
		ifTrue: [ 
			self printUserJoined: anIRCMessage.
			^ self ].
	(anIRCMessage command = #QUIT)
		ifTrue: [ 
			self printUserQuit: anIRCMessage.
			^ self ].
	(self chanInfoCommands includes: (anIRCMessage command))
		ifTrue: [ 
			self processChanInfoCommand: anIRCMessage.
			^ self ].
	(self commandsToIgnore includes: (anIRCMessage command))
		ifTrue: [ ^ self ].
	"newString := String streamContents: [ :stream |
		stream
			nextPutAll: (anIRCMessage asString);
			crlf ]."
	newString := self formatter formatMessage: anIRCMessage.
	self addTextToLog: (newString asText).