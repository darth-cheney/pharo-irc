as yet unclassified
sendLeaveMessage: aString
	"Tells the reciever to send
	a PART message with the incoming string
	as the arguments and trailer"
	| args msg |
	args := ''.
	(self isInChannel)
		ifTrue: [ args := (self channel name) ].
	msg := IRCProtocolMessage new.
	msg
		command: 'PART';
		arguments: args;
		trailer: aString.
	self connection sendMessage: msg.