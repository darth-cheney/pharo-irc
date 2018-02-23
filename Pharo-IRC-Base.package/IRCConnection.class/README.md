I am a connection to an IRC Server.

I handle all receiving and sending of IRC messages on my SocketStream,
and when I connect to a server I fork a process that listens on the
socket at the lowest system priority.

I have an announcer that will announce important messages
for any other objects that wish to listen for events on a 
server level (quitting etc)

I also manage the distribution of certain types of messages to IRCChannel
objects, of which I maintain an active list interally.

NOTE: Because incoming IRC messages have commands, I maintain
a dictionary that maps IRC command names to message symbols that
should be executed on the instance side. See IRCConnection class >> setupIncomingHandlers
and IRCConnection class >> incomingHandlers 

Example: connect to Freenode
| conn |
conn := IRCConnection new.
conn
	hostname: 'irc.freenode.net';
	nickname: 'pharo-user';
	connect;
	inspect.