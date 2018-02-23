initialization
initialize
	"Initialize an instance with empty values
	for the different parts. Note that arguments
	will be an OrderedCollection."

	super initialize.
	arguments := OrderedCollection new.
	"By default, messages are NOT incoming"
	incoming := false.
	^ self.