initialization
initializeWidgets
	textArea := self newText.
	self focusOrder add: textArea.
	connection := IRCConnection new.
	connection addToIncomingSubscribers: self.