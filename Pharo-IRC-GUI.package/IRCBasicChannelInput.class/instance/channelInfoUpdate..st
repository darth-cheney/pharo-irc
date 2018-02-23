as yet unclassified
channelInfoUpdate: anAnnouncement
	"Received when a subscribed channel's
	information (non messages) has been updated"
	
	"For now we merely update the users list"
	self users items: (self channel users).