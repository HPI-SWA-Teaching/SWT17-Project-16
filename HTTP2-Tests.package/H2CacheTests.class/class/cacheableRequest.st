constants
cacheableRequest
	
	^ H2Request new
		header: H2Header new;
		headerAt: ':path' put: '/testPath';
		headerAt: ':method' put: 'GET';
		yourself