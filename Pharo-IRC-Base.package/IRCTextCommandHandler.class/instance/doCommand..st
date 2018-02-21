accessing
doCommand: aLineOfText
	"Parse out the command (first token)
	of the incoming text and map it to the
	appropriate action."
	| stream  cmd rest |
	stream := ReadStream on: aLineOfText.
	stream upTo: $/.
	cmd := stream upTo: $ .
	rest := (stream upToEnd) trimBoth.
	
	(cmd asUppercase = 'MSG')
		ifTrue: [ ^ self sendPrivateMessage: rest ].
	(cmd asUppercase = 'LEAVE')
		ifTrue: [ ^ self sendLeaveMessage: rest ].
	(cmd asUppercase = 'PART')
		ifTrue: [ ^ self sendLeaveMessage: rest ].
	(cmd asUppercase = 'TOPIC')
		ifTrue: [ ^ self sendTopicMessage: rest ].
	self sendDefaultMessage: rest withCommand: (cmd asUppercase).