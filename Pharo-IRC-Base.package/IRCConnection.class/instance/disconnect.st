connection open/close
disconnect
	stream close.
	self checkForIncoming.
	self broadcast.
	stream := nil.