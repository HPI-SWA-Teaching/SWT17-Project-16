testing
testUpgradeToH2CSuccess
	| response |
	
	mock inStream nextPutAll: H2Mock switchingProtocols asString.
	mock inStream nextPutAll: H2Mock emptySettings asString.
	mock inStream nextPutAll: H2Mock standardContentOnStream1 asString.	
	mock inStream reset.	
	
 	response := webclient httpGet: self class exampleUrl. 
	
	self
		assert: [response content = H2Mock standardBodyContent];
		assert: [response class = H2WebResponse];
		assert: [(webclient serverProtocolDictionary at: webclient server) = #h2c]
