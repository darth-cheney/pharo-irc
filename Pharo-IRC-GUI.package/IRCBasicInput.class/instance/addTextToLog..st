adding
addTextToLog: aText
	self logText: aText.
	self logArea text: self logText.
	self logArea sourceTextArea setScrollValue: (self logArea sourceTextArea extent).