testing
testUpgradeToH2CFailure
	| response |
	
	mock inStream nextPutAll: H2Mock standardHttpContent  asString.
	mock inStream reset.
	
	response := webclient httpGet: self class exampleUrl. 
	
	self
		assert: [response content = H2Mock standardBodyContent];
		assert: [response class = WebResponse];
		assert: [(webclient serverProtocolDictionary at: webclient server) = 'http/1.1' asSymbol]
