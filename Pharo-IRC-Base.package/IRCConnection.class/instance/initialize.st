initialization
initialize
	"Default initialization. Will use defaultPort and defaultHost
	 when creating the stream"

	super initialize.
	host := self defaultHost.
	port := self defaultPort.
	nick := self defaultNick.
	userName := self defaultUserName.
	fullName := self defaultFullName.
	
	"Set up a new announcer for the connection"
	announcer := IRCAnnouncer new.
	
	"Set up the outgoing and incoming
	 message queues."
	outgoingQueue := OrderedCollection new.
	incomingQueue := OrderedCollection new.
	^ self.