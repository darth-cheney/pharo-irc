parsing
parse: aLineOfText
	conn ifNil: [ ^ nil ].
	(aLineOfText first = $/)
		ifTrue: [ self doCommand: aLineOfText ]
		ifFalse: [ self doNonCommand: aLineOfText ].
	
	
	
	