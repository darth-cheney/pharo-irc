I am a utility class that listens for IRCLogMessageAnnouncements on an IRCConnection.
I maintain an active collection of all IRCProtocolMessages that have been received on
the connection, flushing out to a file when the collection has surpassed 500 items.

I am instantiated as a singleton which can be accessed via IRCMessageLogUtil class >> log.

