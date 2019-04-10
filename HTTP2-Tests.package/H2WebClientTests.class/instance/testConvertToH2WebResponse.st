testing
testConvertToH2WebResponse
	| promise webresponse |
	
	webclient h2Session cache: H2Cache new.
	promise := webclient h2Session send: (webclient h2Session newRequestFor: self class examplePath).
	
	mock inStream nextPutAll: H2Mock standardContentOnStream3 asString.	
	mock inStream reset.	
	
	webresponse := webclient h2Session newH2WebResponseFor: promise.
	promise := promise value.
	
	self
		assert: webresponse code = (promise header dictionary at: ':status') asInteger;
		assert: webresponse protocol = webresponse class standardProtocol;
		assert: webresponse stream = mock;
		assert: webresponse content = promise data asString
