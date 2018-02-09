as yet unclassified
createChannelsWithUsers: aUsersCollection
	"Creates 10 new channels on the connection
	and populates each of them with the passed
	list of users."
	(1 to: 10) do: [ :num |
		| chanName |
		chanName := '#test',(num asString).
		conn addChannelNamed: chanName.
		(conn channels at: chanName)
			users addAll: aUsersCollection ].