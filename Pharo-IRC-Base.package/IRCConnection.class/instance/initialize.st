initialization
initialize
	"Basic initialization.
	 We set the internal stream
	 to nil until some connect message
	 dictates otherwise."
	stream := nil.
	port := self defaultPort.
	hostname := self defaultHostname.
	incomingMessages := OrderedCollection new.
	incomingSubscribers := OrderedCollection new.
	outgoingMessages := OrderedCollection new.
	^ self.