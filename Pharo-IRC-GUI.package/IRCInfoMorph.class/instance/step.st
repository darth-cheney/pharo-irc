stepping and presenter
step
	| connCount chanCount msgCount |
	connCount := self getConnectionCount.
	chanCount := self getChanCount.
	msgCount := self getMsgCount.
	
	self contents: (Text streamContents: [ :stream | 
		stream
			nextPutAll: 'Total Connections: ';
			nextPutAll: (connCount asString asText);
			nextPutAll: (String crlf) asText;
			nextPutAll: 'Total Channels: ';
			nextPutAll: (chanCount asString asText);
			nextPutAll: (String crlf) asText;
			nextPutAll: 'Message Log Count: ';
			nextPutAll: (String crlf) asText;
			nextPutAll: (msgCount asString asText) ]).