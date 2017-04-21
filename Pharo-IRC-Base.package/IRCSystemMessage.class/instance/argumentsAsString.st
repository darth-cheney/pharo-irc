as yet unclassified
argumentsAsString
	| result |
	"Returns a concatenated string of space-separated arguments from
	 the arguments collection".
	result := ''.
	arguments ifEmpty: [ ^ result ].
	arguments do: [ :arg |
		result := (result, ' ', (arg asString)) ].
	^ result.
	