initialization
initialize
	super initialize.
	messageLog := OrderedCollection new.
	logFileReference := self defaultLogFileReference.