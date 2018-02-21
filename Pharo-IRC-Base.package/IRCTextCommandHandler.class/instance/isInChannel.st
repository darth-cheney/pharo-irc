testing
isInChannel
	"If the receiver has the chan inst var
	set, this means the handler is in a
	channel context (rather than just a basic
	server context)"
	^ chan isNotNil