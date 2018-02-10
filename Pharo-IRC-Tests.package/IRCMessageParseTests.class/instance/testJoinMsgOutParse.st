tests
testJoinMsgOutParse
	"Test the parsing of *outbound*
	JOIN messages"
	| examples |
	examples := { 
		'JOIN #foobar'.
		'JOIN &foo fubar'.
		'JOIN #foo,&bar fubar'.
		'JOIN #foo,#bar fubar,foobar'.
		'JOIN #foo,#bar'.
		'JOIN 0' }.
	examples do: [ :ex |
		self joinMsgIsOk: ex ].
	