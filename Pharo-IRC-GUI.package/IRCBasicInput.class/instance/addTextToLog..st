adding
addTextToLog: aText
	self logText: aText.
	self logArea insert: aText at: self logArea text size.
	"self logArea sourceTextArea setScrollValue: (self logArea sourceTextArea extent)."