converting
asString
	"Format the parts of the message into 
	a correct RFC compliant message string"
	| stream |
	stream := String new writeStream.
	prefix ifNotNil: [ stream nextPutAll: prefix ].
	command ifNotNil: [ stream 
							nextPut: $ ;
							nextPutAll: command ].
	arguments ifNotEmpty: [
		arguments do: [ :arg |
			stream 
				nextPut: $ ;
				nextPutAll: arg ]
		].
	trailer ifNotNil: [ stream 
						nextPut: $ ;
						nextPut: $:;
						nextPutAll: trailer ].
	^ stream contents.