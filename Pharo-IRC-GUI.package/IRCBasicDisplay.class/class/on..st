instance creation
on: anIRCConnection
	"Open a Basic Display window linked to the
	passed connection, but don't necessarily start
	to connect"
	| model |
	model := self connection: anIRCConnection.
	model open.
	model window whenClosedDo: [ model windowCloseAction ].