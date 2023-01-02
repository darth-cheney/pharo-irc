as yet unclassified
handleInput: text
	"Action to take when the user
	has submitted text in the input area"
	"inputText := self input text veryDeepCopy.
	(inputText beginsWith: '/')
		ifTrue: [ 
			self doCommand: inputText ]
		ifFalse: [ self doNonCommandText: inputText ]."
	self commandHandler parse: text.
	self input text: ''.