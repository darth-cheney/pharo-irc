as yet unclassified
connection: anIRCConnection named: aStringOrSymbol
	| chan |
	chan := self new.
	chan
		connection: anIRCConnection;
		name: aStringOrSymbol.
	^ chan