initialization
initializeWidgets
	logArea := self instantiate: TextModel.
	logArea color: (Color r: 0.301 g: 0.301 b: 0.301 alpha: 1.0).
	input := self instantiate: TextInputFieldModel.
	ann := Announcer new.
	self input whenTextIsAccepted: [self handleInput].