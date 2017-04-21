as yet unclassified
extractPrefixAndCommandFrom: aString
	"Attempts to extract the prefix and command portions
	 of the IRC message string. Based on the same method
	 in squIRC"
	| stream command prefix arguments trailer |
	stream := ReadStream on: aString.
	command := stream upTo: $ .
	command first = $: ifTrue: [ 
		prefix := command copyFrom: 2 to: command size.
		command := stream upTo: $ ].
	arguments := stream upTo: $:.
	stream atEnd ifFalse: [ trailer := stream upToEnd ].
	^ Dictionary newFrom: { 
		#prefix -> prefix.
		#command -> command.
		#arguments -> arguments.
		#trailer -> trailer }.