as yet unclassified
argumentsFromString: aString
	"Here we simply use a stream to isolate
	each space separated argument"
	| readStream result | 
	readStream := ReadStream on: aString.
	result := OrderedCollection new.
	[ readStream atEnd ] whileFalse: [
		result add: (readStream upTo: $ )].
	arguments := result.