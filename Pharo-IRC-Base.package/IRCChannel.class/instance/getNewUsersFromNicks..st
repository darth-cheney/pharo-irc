as yet unclassified
getNewUsersFromNicks: aCollectionOfNames
	"For a given collection of nicknames,
	the receiver will scan other channels on the
	same connection to see if a user with the nick exists
	already on another channel. If so, we add that user to
	the response. Otherwise, we create a whole new user."
	