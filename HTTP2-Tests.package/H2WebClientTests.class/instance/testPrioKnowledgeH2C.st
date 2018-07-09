testing
testPrioKnowledgeH2C
	| response |
	
	mock inStream nextPutAll: H2Mock standardContentOnStream3 asString.	
	mock inStream reset.	
	
	webclient registerProtocol: #h2c for: self class exampleServerName. 
	
	response := webclient httpGet: self class exampleUrl. 
	
	self
		assert: [response content = H2Mock standardBodyContent];
		assert: [response class = H2WebResponse];
		assert: [(webclient serverProtocolDictionary at: webclient server) = #h2c]
