initialization
initialize
	super initialize.
	
	users := OrderedCollection new.
	msgLog := OrderedCollection new.
	announcer := Announcer new.
	mode := Set new.
	^ self