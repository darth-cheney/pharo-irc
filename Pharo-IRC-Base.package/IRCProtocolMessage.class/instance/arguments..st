accessing
arguments: aStringOrCollection
	aStringOrCollection isString 
		ifTrue: [
			self argumentsFromString: aStringOrCollection  ]
		ifFalse: [
			arguments := aStringOrCollection ].