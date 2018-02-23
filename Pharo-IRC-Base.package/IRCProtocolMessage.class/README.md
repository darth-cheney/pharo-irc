I am the concrete implementation of an IRC protocol message
as defined in the RFC.

I can individually parse out the prefix, command, arguments, and trailer
(these are the key parts of an IRC message according to the BNF).

Use IRCProtocolMessage class >> fromString: to parse incoming messages
on the wire.

Example
--------
| msg |
msg := IRCProtocolMessage fromString: ':server!somehost.com JOIN pharo-user #test-channel'.
msg inspect.

| msg2 |
msg2 := IRCProtocolMessage fromString: ':pharo-user!somehost.com PRIVMSG #test-channel :Hey guys this is a message on the channel called #test-channel!'.
msg2 inspect.