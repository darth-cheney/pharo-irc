as yet unclassified
exampleFreenode
	| conn |
	conn := IRCConnection new.
	(self connection: conn) openWithSpec.
	conn connect.