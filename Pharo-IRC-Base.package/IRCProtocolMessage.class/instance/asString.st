converting
asString
	"Format the parts of the message into 
	a correct RFC compliant message string"
	| stream |
	stream := String new writeStream.
	prefix ifNotNil: [ stream
								nextPut: $:; 
								nextPutAll: prefix;
								nextPut: $  ].
	command ifNotNil: [ stream 
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