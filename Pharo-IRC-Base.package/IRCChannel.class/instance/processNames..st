message-processing
processNames: anIRCMessage
	"Process a 353 names response message"
	| userNames newUsers |
	userNames := (anIRCMessage trailer trimBoth splitOn: $ ) select: [ :aName |
		(aName = self connection nickname) not ].
	
	"Add new users with the given nickname"
	"userNames := userNames collect: [ :uname | 
		(IRCUser nicknamed: uname)]."
	newUsers := self getNewUsersFromNicks: userNames.
	
	"Check to see if the any of the new users
	have nicks beginning with symbols. This indicates
	we need to update the nickname and also change the
	initial channel mode (usually via RPL_NAMEREPLY"
	newUsers do: [ :user |
		| trimmedNick |
		trimmedNick := user nickname.
		(trimmedNick first isAlphaNumeric)
			ifTrue: [ trimmedNick := (trimmedNick copyFrom: 2 to: (trimmedNick size)) ].
		(trimmedNick = self connection nickname)
			ifFalse: [ 
				self addUser: user.
				self modeFromPrefixForUser: user ] ].
	
	announcer announce: (IRCMessageAnnouncement new message: anIRCMessage).
	announcer announce: (IRCChanInfoAnnouncement new channel: self).
	