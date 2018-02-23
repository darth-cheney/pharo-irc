I am an implementation of a specific IRCChannel. I maintain a reference to
the connection that created me, as well as a list of IRCUser instances
that are in my channel.

I have my own announcer, which I use to announce any new messages, JOIN/PART
events, and others to whomever is interested. 

Though my IRCConnection instance 
will handle sending me IRC messages that are channel specific or channel
relevant (via IRCChannel >> incomingMessage:) I also maintain my own ability
to process IRC messages using a class level dictionary mapping IRC commands to
optional handlers on the instance side (See IRCChannel class >> setupIncomingHandlers
and IRCChannel class >> incomingHandlers). 