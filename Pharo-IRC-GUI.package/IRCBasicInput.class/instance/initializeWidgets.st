initialization
initializeWidgets

	logArea := self newText.
	logArea beNotEditable.
	logArea color: (Color
			 r: 0.301
			 g: 0.301
			 b: 0.301
			 alpha: 1.0).
	input := self newTextInput.
	ann := Announcer new.
	formatter := IRCBasicTextFormatter new.
	cmdHandler := IRCTextCommandHandler new.
	cmdHandler connection: self connection.
	self input whenSubmitDo: [ :text | text ifNotEmpty: [ self handleInput: text ] ]