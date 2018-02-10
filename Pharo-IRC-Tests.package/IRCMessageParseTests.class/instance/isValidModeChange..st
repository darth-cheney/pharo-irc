testing
isValidModeChange: aString
	"Returns true if both the prefix and mode
	letter(s) in the string are valid."
	| ops modes |
	ops := #($+ $-).
	modes := #($a $i $I $w $r $o $O $s).
	(aString size = 1)
		ifTrue: [ ^ (modes includes: (aString first)) ].
	(ops includes: (aString first))
		ifFalse: [ ^ false ].
	(aString copyFrom: 2 to: (aString size)) do: [ :char |
		(modes includes: char)
			ifFalse: [ ^ false ] ].
	^ true