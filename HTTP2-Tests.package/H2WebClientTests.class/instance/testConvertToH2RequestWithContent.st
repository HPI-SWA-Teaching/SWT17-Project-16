testing
testConvertToH2RequestWithContent
	| H2request request |
	
	webclient server: self class exampleServer.
	request := WebRequest new 
		initializeFromUrl: self class exampleUrl;
		method: 'GET';
		headerAt: 'Host' put: self class exampleServer;
		yourself.
	H2request := H2Request newFrom: request with: self class exampleContentBlock. 
	
	self
		assert: (H2request header at: ':method') = 'GET';
		assert: (H2request header at: ':path') = self class examplePath;
		assert: (H2request header at: ':authority') = self class exampleServer;
		assert: (H2request header at: ':scheme') = 'http';
		assert: H2request data = self class exampleContent
