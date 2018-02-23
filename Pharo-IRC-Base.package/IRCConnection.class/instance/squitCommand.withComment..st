initialization
squitCommand: aServername withComment: aComment
	"Composes an IRCProtocolMessage for the
	SQUIT command on the given server with the
	given comment."
	self
		sendMessage: (IRCProtocolMessage new
							command: 'SQUIT'
							arguments: {aServername}
							trailer: aComment).