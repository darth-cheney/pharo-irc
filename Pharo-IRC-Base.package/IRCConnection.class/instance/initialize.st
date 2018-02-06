initialization
initialize
	"Creates a new server instance without
	a configured connection object.
	Uses the default Nick and Pass."
	user := IRCUser new.
	password := nil.
	hostname := 'irc.freenode.net'.
	port := 6667.
	
	"We set up outgoing in incoming message queues
	that will be flushed with each listen loop"
	outQueue := OrderedCollection new.
	msgLog := OrderedCollection new.
	channels := Dictionary new.
	
	"Initialize the subscribers dictionary of
	collections"
	"subscribers := Dictionary new.
	subscribers
		at: #outgoing put: (OrderedCollection new);
		at: #incoming put: (OrderedCollection new)."
	"Initialize the Announcer"
	announcer := Announcer new.
	^ self.