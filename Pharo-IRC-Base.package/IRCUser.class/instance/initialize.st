initialization
initialize
	super initialize.
	self setDefaults.
	mode := Set new.
	
	"A dictionary that maps
	channel name keys to mode sets
	for the user on the given channel"
	chanModes := Dictionary new.