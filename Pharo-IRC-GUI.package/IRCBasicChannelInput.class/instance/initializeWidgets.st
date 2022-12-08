initialization
initializeWidgets
	super initializeWidgets.
	users := self newList.
	users
		display: [ :item |
			item nickname ].
	self commandHandler channel: self channel.