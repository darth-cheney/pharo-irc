as yet unclassified
processNick: anIRCMessage 
	"Handles incoming NICK messages.
	Will change the nickname of any existing
	user in the receiver's user list, if present.
	Will also announce message and chanInfo announcements.
	If user is not found on this channel, receiver does nothing"
	| oldNick newNick |
	oldNick := self connection nickFromPrefix: anIRCMessage.
	(anIRCMessage arguments size >= 1)
		ifTrue: [ newNick := anIRCMessage arguments last ]
		ifFalse: [ newNick := anIRCMessage trailer ].
	(self hasUserNicknamed: oldNick)
		ifTrue: [ 
			(self users detect: [ :user | 
				user nickname = oldNick]) nickname: newNick.
			announcer announce: (IRCMessageAnnouncement new message: anIRCMessage).
			announcer announce: (IRCChanInfoAnnouncement new channel: self) ].