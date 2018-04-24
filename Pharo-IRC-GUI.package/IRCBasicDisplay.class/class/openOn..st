instance creation
openOn: anIRCConnection
	"Open a new window on a specified IRCConnection instance"
	| model |
	model := self connection: anIRCConnection.
	model openWithSpec.
	model window whenClosedDo: [ model windowCloseAction ].
	anIRCConnection isConnected ifFalse: [ 
		anIRCConnection connect ].