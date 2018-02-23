I am a representation of an IRCUser. I contain a Set that corresponds to
the individual characters that make up my overall server mode (#mode) and
also a Dictionary that maintains my mode Set on each channel to which I
am currently joined with.

I have the basics: username, nickname, etc.

In any IRCConnection, there is always one of me that represents
the current user (you) at IRCConnection >> user.