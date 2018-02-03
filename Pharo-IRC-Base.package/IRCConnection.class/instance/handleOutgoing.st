initialization
handleOutgoing
	"For each message in the outgoing queue,
	send the string version across the socket.
	Then announce to any subscribers."
	| sentMessages |
	sentMessages := OrderedCollection new.
	outQueue do: [ :msg |
		self connection isConnected ifTrue: [ 
			self connection sendCommand: msg asString.
			sentMessages add: msg] ].
	announcer announce: (IRCSystemMessageAnnouncement new messages: sentMessages; type: #outgoing).
	
	"Flush any messages that were actually sent"
	sentMessages do: [ :msg | outQueue remove: msg ].