initialization
incomingIRCMessage: anIRCMessage
	| msgText |
	msgText := anIRCMessage toString.
	self textArea text: (self textArea text, msgText, (Character cr asString)).