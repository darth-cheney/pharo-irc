as yet unclassified
displayBackLog
	"Clear the logArea and rewrite
	all messages in the channel log
	to the logArea"
	self clearLogArea.
	self channel messageLog do: [ :msg |
		self processIncoming: msg ].