initialization
exampleRequest
	^ HTTP2Request new
		header: (HTTP2Header new);
		headerAt: ':method' put: 'GET';
		headerAt: ':path' put: '/aPath/example/';
		headerAt: ':scheme' put: 'http';
		headerAt: ':authority' put: 'www.example.com'
	