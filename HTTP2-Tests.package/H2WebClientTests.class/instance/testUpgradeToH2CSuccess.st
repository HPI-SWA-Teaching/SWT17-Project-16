as yet unclassified
testUpgradeToH2CSuccess
	|response|
	
	mock inStream nextPutAll: H2Mock switchingPorotcols  asString.
	mock inStream nextPutAll: H2Mock emptySettings asString.
	mock inStream nextPutAll: H2Mock standardContentOn1 asString.	
	mock inStream reset.	
	
	response:= webclient httpGet: self class exampleUrl. 
	
	self assert:[response content ='<html> HELLO WORLD </html>'].
	self assert:[response class = H2WebResponse].
	self assert:[(webclient serverProtocolDictionary at: (webclient server)) = #h2c].
	
	