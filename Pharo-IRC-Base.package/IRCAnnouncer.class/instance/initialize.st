initialization
initialize
	super initialize.
	incomingSubscribers := OrderedCollection new.
	outgoingSubscribers := OrderedCollection new.