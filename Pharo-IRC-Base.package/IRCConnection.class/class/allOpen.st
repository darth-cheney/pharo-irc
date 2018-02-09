as yet unclassified
allOpen
	"Respons will all instances of 
	the receiver whose connections
	are still active"
	^ (self allInstances select: [ :inst | 
		inst isConnected ]).