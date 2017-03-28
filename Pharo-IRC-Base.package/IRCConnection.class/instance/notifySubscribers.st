as yet unclassified
notifySubscribers
	"TODO: Change completely. For now we
	 simply notify the Transcript"
	incomingSubscribers do: [ :subscriber |
		incomingMessages do: [ :msg | 
			subscriber incomingMessage: msg
			]. 
		].

	