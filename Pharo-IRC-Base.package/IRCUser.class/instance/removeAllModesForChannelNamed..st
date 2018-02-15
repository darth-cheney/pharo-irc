as yet unclassified
removeAllModesForChannelNamed: aString 
	"Removes any key reference to the channel
	name from the receiver's internal chanModes
	Dictionary"
	chanModes removeKey: aString ifAbsent: [ nil ].