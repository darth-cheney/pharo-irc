as yet unclassified
setupGlobalLog
	globalLog ifTrue: [ 
		announcer
			when: IRCLogMessageAnnouncement
			send: #rcvMsgAnnouncement:
			to: IRCMessageLogUtil ].