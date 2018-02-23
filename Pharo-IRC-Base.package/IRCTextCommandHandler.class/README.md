I am a plugin that takes a single line of text and interprets it
as an IRC command from the user. I am designed to be used by UIs.
My behavior should be similar to that of other IRC clients.

Each command begins with $/ (the command character) and the
subsequent token will be interpreted as needed by my implementation.
The default behavior is to send that token 1-to-1 as an actual IRC command 
(ie '/quit :see you later!' would send the QUIT command with a trailer 'see you later!')

If the line begins without the command character, I am interpreted as a PRIVMSG from
the connection's primary user to whatever channel is hosting the TextCommandHandler.
If there is not channel, nothing happens.

At the very least I should always be used with an IRCConnection instance, and usually
an IRCChannel instance also. Note that when being used only with a connection and not a
channel, I should have the behavior that any text input does in other IRC clients when
on the Server screen (not in a channel).