testing
isError
	"Responds with true if the message
	command indicates an error, either
	4xx or 5xx"
	self command first = $4
		ifTrue: [ ^ true ].
	self command first = $5
		ifTrue: [ ^ true ].
	^ false