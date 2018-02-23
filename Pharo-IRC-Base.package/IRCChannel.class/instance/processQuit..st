initialization
processQuit: anIRCMessage
	"Deals with any server sent
	QUIT messages that refer to
	other users. Remove the user
	from the channel's users list"
	| foundUsers nick |
	nick := self connection nickFromPrefix: anIRCMessage.
	foundUsers := self users select: [ :u |
		u nickname = nick ].
	foundUsers ifNotNil: [ 
		foundUsers do: [ :u | self users remove: u ].
		self privAnnouncer announce: (IRCChanInfoAnnouncement new channel: self) ].
	self privAnnouncer announce: (IRCMessageAnnouncement new message: anIRCMessage).