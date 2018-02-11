accessing structure variables
connection: anIRCConnection
	conn := anIRCConnection.
	formatter
		ifNotNil: [ formatter connection: anIRCConnection ].