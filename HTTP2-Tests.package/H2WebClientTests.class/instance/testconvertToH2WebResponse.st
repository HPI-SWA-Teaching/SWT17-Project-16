as yet unclassified
testconvertToH2WebResponse
	
	| promise webresponse |
	
	mock inStream nextPutAll: H2Mock standardContentOn3  asString.	
	mock inStream reset.	
	
	promise := webclient h2Session send: (webclient h2Session newRequestFor: self class examplePath).
	
	webresponse := webclient h2Session newH2WebResponseFor: promise.
	
	promise := promise value .
	
	self assert: (webresponse code = ((promise header dictionary at: ':status') asInteger  )). 
	self assert: (webresponse  protocol ) = (webresponse class standardProtocol ). 
	self assert: (webresponse stream ) = ( mock).
	self assert: (webresponse content ) = (promise data asString). 