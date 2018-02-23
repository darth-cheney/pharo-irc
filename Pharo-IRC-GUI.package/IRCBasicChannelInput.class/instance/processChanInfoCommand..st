as yet unclassified
processChanInfoCommand: anIRCMessage
	"Deal with any incoming messages
	that contain information about
	the channel itself"
	| cmd |
	cmd := anIRCMessage command.
	(cmd = '331')
		ifTrue: [ 
			^ self printNoTopic ].
	(cmd = '332')
		ifTrue: [ 
			^ self printTopic: anIRCMessage ].
	(cmd = '333')
		ifTrue: [ 
			^ self printTopicWho: anIRCMessage ].