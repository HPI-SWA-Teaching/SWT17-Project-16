testing
testPrioKnowledgeHttp
	| response |
	
	mock inStream nextPutAll: H2Mock standardHttpContent asString.
	mock inStream reset.	
	
	webclient registerProtocol: 'http/1.1' asSymbol  for: self class exampleServerName. 
	
	response := webclient httpGet: self class exampleUrl. 
	
	self
		assert: [response content = H2Mock standardBodyContent];
		assert: [response class = WebResponse];
		assert: [(webclient serverProtocolDictionary at: webclient server) = 'http/1.1' asSymbol]
