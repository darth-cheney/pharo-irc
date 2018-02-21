as yet unclassified
handleInput
	"Action to take when the user
	has submitted text in the input area"
	| inputText |
	"inputText := self input text veryDeepCopy.
	(inputText beginsWith: '/')
		ifTrue: [ 
			self doCommand: inputText ]
		ifFalse: [ self doNonCommandText: inputText ]."
	self commandHandler parse: (self input text).
	self input text: ''.