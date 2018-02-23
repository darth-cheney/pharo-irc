accessing
logText
	^ logText
		ifNil: [ logText := '' asText. logText ].