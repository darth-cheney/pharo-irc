I represent a basic Spec display for either server
information on an IRCConnection, or an IRCChannel (via my
subclass IRCBasicChannelInput).

I contain a textarea that listens for IRCMessageAnnouncements
and displays them one line at a time. I also contian a text input
for handling commands, which are handled by my #commandHandler (an
instance of IRCTextCommandHandler).

My incoming IRCProtocolMessages are formatted as text via my #formatter,
which is an instance of IRCBasicTextFormatter.

For an example, see the class comment of IRCBasicDisplay