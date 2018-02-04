initialization
initializeWidgets
	logArea := self instantiate: TextModel.
	input := self instantiate: TextInputFieldModel.
	ann := Announcer new.
	self input whenTextIsAccepted: [self handleInput].