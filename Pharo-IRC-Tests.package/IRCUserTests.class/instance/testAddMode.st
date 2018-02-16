tests
testAddMode
	"Ensures that the IRCUser can deal with
	adding a specific MODE (from server)."
	user nickname: 'pharo-user'.
	user addMode: 'iw'.
	self assert: (user mode includes: $i).
	self assert: (user mode includes: $w).
	user addMode: 's'.
	self assert: (user mode includesAll: #($i $w $s)).
	