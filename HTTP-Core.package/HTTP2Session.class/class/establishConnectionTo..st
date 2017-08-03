instance creation
establishConnectionTo: server
	|session|
	session := (HTTP2Session new)
		server: server.
	session connection: (HTTP2Connection connectTo: server).
	^session