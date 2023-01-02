initialization
defaultLayout

	^ SpBoxLayout newTopToBottom
		  add: logArea;
		  add: input height: 25;
		  yourself