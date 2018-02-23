adding
addTextToLog: aText
	self logText: aText.
	self logArea textArea appendText: aText.
	"self logArea sourceTextArea setScrollValue: (self logArea sourceTextArea extent)."