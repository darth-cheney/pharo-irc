I am an abstract class whose subclasses represent different schemes for formatting IRCProtocolMessages as Text. These are used for display purposes

At minimum, the instances of my subclasses require an IRCConnection, which I hold in my `conn` instance variable.

My subclasses should also implement a class variable and message for #messageHandlers, which is a Dictionary that associates IRCProtocolMessage command names with symbols corresponding to instance messages that will handle formatting text for those types of messages.

See my subclasses for more concrete implementation information