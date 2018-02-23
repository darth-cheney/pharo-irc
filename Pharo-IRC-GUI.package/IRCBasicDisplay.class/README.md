I am a Spec-based basic IRC display window. I contain instances of an IRCBasicInput spec (see comments)
and a TabManager for initializing new IRCBasicChannelInput spec instances as new IRCChannels are joined by
the primary user. 

When connected with an IRCConnection instance, I will subscribe to
IRCJoinedChannelAnnouncement at my own #handleJoinChannel:, which will
create a new Tab containing a new IRCBasicChannelInput bound to the channel.

Example
-------
| conn display |
conn := IRCConnection new.
conn
	nickname: 'pharo-user';
	hostname: 'irc.freenode.net'.
display := IRCBasicDisplay connection: conn.
display openWithSpec.
conn connect.
 