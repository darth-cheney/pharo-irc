as yet unclassified
setupNonAlphaNickModeMap
	"Responds with a dictionary mapping
	symbols that can appear at the beginning of a nick
	during RPL_NAMEREPLY to the modes that should be
	added based upon that symbol"
	NonAlphaNickModeMap := { 
	$& -> $a. "Channel Admin"
	$~ -> $q. "Channel owner"
	$% -> $h. "Channel Halfop"
	$+ -> $v. "Channel voiced"
	$@ -> $o. "Channel full op"
	 } asDictionary.