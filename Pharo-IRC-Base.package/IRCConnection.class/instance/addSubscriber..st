initialization
addSubscriber: anObject
	"Adds the passed Object to the Announcer.
	Will send the Symbol specified in defaultReceiveSymbol
	as the message symbol"
	self
		addSubscriber: anObject
		on: (self defaultReceiveSymbol).