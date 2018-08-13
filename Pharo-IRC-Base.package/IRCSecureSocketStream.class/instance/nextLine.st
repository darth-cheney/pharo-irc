accessing
nextLine
	| wrapper |
	wrapper := ZnCharacterReadStream on: self.
	^ wrapper nextLine.