I am announced by both IRCConnection and IRCChannel whenever a new
IRCProtocolMessage has come in from the server.

Note that IRCConnection and IRCChannel will each handle incoming
messages *before* making these announcements.

I am designed to be used by UIs, but not for handling message
processing in IRCConnection or IRCChannel.