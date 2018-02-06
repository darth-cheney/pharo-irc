initialization
modeCommand: aTwoCharString
	"Composes an IRCProtocolMessage for the
	MODE command using the passed in string,
	which should consist of two characters:
	either a +/- and any of
		a - user is flagged as away;
          	 i - marks a users as invisible;
           	w - user receives wallops;
         	r - restricted user connection;
           	o - operator flag;
           	O - local operator flag;
           	s - marks a user for receipt of server notices"
	self
		sendMessage: (IRCProtocolMessage new
							command: 'MODE'
							arguments: { user nickname. aTwoCharString }).