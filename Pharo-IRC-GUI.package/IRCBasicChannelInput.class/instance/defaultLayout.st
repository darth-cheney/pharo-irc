as yet unclassified
defaultLayout

	^ SpBoxLayout newTopToBottom
		  add: (SpBoxLayout newLeftToRight
				   add: logArea;
				   add: users width: 200;
				   yourself);
		  add: input height: 25;
		  yourself