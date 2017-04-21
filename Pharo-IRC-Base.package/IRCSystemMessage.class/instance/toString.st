as yet unclassified
toString
	"Return the current message's structure as a valid IRC system string."
	| result |
	result := ''.
	prefix ifNotNil: [ result := (result, prefix) ].
	command ifNotNil: [ result := (result, ' ', command) ].
	arguments ifNotEmpty: [ result := (result, ' ', self argumentsAsString) ].
	trailer ifNotNil: [ result := (result, ' ', trailer) ].
	^ result.
	