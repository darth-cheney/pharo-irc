tests
testSendMessageToAllChans
	| ex |
	(1 to: 10) do: [ :num |
		| name |
		name := '#test',(num asString).
		conn addChannelNamed: name ].
	ex := IRCProtocolMessage fromString: ':user!server PRIVMSG other-user :Hey this is a private chat!'.
	conn sendMessageToAllChans: ex.
	conn channels do: [ :chan |
		self assert: (chan messageLog includes: ex) ].