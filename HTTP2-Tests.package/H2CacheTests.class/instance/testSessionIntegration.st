testing
testSessionIntegration
	| session mock request promise1 promise2 |
	
	mock := H2Mock on: String new.
	mock inStream nextPutAll: H2Mock standardContentOnStream3 asString.
	mock inStream reset.
	
	session := H2Session new
		server: 'pseudoserver.name';
		connection: (H2Connection newWith: mock);
		cache: H2Cache new;
		yourself.
	request := session newRequestFor: '/'.
	
	promise1 := session send: request.
	promise2 := session send: request.
	self assert: promise1 identical: promise2.