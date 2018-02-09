as yet unclassified
getChanCount
	"Respond with the total number of
	open channels across all active 
	IRC connections"
	^ (IRCChannel allInstances select: [ :inst |
		| isBound | 
		isBound := inst connection channels includes: inst.
		isBound and: [ inst connection isConnected ] ]) size.
	