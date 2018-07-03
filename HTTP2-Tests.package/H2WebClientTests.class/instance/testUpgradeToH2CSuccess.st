as yet unclassified
testUpgradeToH2CSuccess
	|wc mock response|
	wc:=H2WebClient new.
	
	mock := H2Mock on: ''.
	mock inStream nextPutAll: H2Mock upgradeSuccessful asString.
	mock inStream nextPutAll: H2Mock emptySettings asString.
	mock inStream nextPutAll: H2Mock standardContent asString.	
	mock inStream reset.	
	mock lockStreamOf: wc.
	
	response:= wc httpGet: 'http://www.google.com' do:[:v|]. 
	
	self assert:[response content ='<html> HELLO WORLD </html>'].
	self assert:[(wc serverProtocolDictionary at: (wc server)) = #h2c].
	
	