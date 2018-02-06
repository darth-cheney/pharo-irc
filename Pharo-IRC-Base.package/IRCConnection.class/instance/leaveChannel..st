as yet unclassified
leaveChannel: aChannel
	"Simply removes the channel from the list.
	Any IRCLeaveChannelAnnouncement should be
	announced from the channel instances themselves
	before or after sending this message."
	self channels removeKey: (aChannel name).