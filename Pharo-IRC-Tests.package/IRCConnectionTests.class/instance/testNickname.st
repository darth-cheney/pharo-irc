tests
testNickname
	"Test the setting and getting of the nickname
	for the connection. This requires testing because
	they are convenience messages for the underlying
	IRCUser"
	conn nickname: '12345hello'.
	self assert: conn nickname equals: '12345hello'.