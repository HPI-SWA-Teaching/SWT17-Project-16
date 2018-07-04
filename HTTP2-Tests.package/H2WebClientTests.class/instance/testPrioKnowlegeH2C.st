as yet unclassified
testPrioKnowlegeH2C
	|response|
	
	mock inStream nextPutAll: H2Mock standardContentOn3  asString.	
	mock inStream reset.	
	
	webclient protocol: #h2c for: self class exampleServerName  . 
	
	response:= webclient httpGet: self class exampleUrl. 
	
	self assert:[response content ='<html> HELLO WORLD </html>'].
	self assert:[response class = H2WebResponse].
	self assert:[(webclient serverProtocolDictionary at: (webclient server)) = #h2c].
	
	