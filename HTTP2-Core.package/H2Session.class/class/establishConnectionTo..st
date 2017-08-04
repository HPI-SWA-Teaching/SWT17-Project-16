instance creation
establishConnectionTo: server
	|session|
	session := (H2Session new)
		server: server.
	session connection: (H2Connection connectTo: server).
	^session