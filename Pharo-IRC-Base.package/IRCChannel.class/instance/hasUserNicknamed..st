testing
hasUserNicknamed: aString
	"Responds true if the receiver
	has a user in the channel's
	userlist with the passed nickname"
	self users do: [ :user |
		(user nickname = aString)
			ifTrue: [ ^ true ] ].
	^ false