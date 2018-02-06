initialization
initializeWidgets
	super initializeWidgets.
	users := self instantiate: ListModel.
	users
		displayBlock: [ :item |
			item nickname ].