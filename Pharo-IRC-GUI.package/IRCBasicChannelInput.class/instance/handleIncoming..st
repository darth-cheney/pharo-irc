as yet unclassified
handleIncoming: anAnnouncement
	"For now, we simply unpack the
	message from the announcement"
	self processIncoming: (anAnnouncement message).