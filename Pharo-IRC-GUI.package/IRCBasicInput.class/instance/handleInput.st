as yet unclassified
handleInput
	"Action to take when the user
	has submitted text in the input area"
	| inputText |
	inputText := self input text veryDeepCopy. "Why deep?"
	(inputText beginsWith: '/')
		ifTrue: [ 
			self doCommand: inputText ]
		ifFalse: [ 
			self reportInvalidInput: inputText ].
	self input text: ''.