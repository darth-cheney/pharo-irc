initialization
initializeWidgets
	super initializeWidgets.
	users := self newList.
	users
		displayBlock: [ :item |
			item nickname ].
	self commandHandler channel: self channel.