initialization
exampleRequest
	^ H2Request new
		header: (H2Header new);
		headerAt: ':method' put: 'GET';
		headerAt: ':path' put: '/aPath/example/';
		headerAt: ':scheme' put: 'http';
		headerAt: ':authority' put: 'www.example.com'
	