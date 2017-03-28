adding
addToIncomingSubscribers: anObject
	"Adds an object to the collection of
	 those who subscribe to incoming messages.
	 The object must have an incomingMessage: message
	 that accepts a line of text."
	incomingSubscribers add: anObject.