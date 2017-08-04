sending
newRequestFor: aPath
	| request |
	request := HTTP2Request new.
	request header: HTTP2Header new.
	request header
		add: ':method'-> 'GET';
		add: ':path' -> aPath;
		add: ':scheme' -> 'http';
		add: ':authority' -> self server.
	^ request