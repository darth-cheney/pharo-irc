as yet unclassified
connectionQuit: anAnnouncement
	"Handle the IRCQuitAnnouncement"
	^ self printConnectionQuit: (anAnnouncement message).