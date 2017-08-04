sending
newRequestFor: aPath
	| request |
	request := H2Request new.
	request header: H2Header new.
	request header
		add: ':method'-> 'GET';
		add: ':path' -> aPath;
		add: ':scheme' -> 'http';
		add: ':authority' -> self server.
	^ request