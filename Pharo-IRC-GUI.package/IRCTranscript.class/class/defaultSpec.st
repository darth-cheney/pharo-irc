specs
defaultSpec
	^ SpecLayout composed
		newColumn: [ :c |
			c add: #textArea ];
		yourself