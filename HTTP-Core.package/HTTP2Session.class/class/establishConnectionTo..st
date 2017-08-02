as yet unclassified
establishConnectionTo: server
	|session|
	session := (HTTP2Session new)
		server: server.
	session streamManager: (HTTP2Connection connectTo: server).
	^session