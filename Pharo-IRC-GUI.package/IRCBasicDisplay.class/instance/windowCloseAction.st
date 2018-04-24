as yet unclassified
windowCloseAction
	"When the model's window is closed, we should
	terminate any active connection that might be
	attached to it."
	self connection ifNotNil: [ 
		self connection disconnect ].