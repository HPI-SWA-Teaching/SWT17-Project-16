testing
testIncomingTraffic_HD
	| header data |
	
	header := H2StreamTests standardResponseHeaderSuccess.
	data := 'some Data' asByteArray.
	
	self receiveHeader: header inParts: 1.
	self receiveClosingData: data inParts: 1.
	
	self assert: (stream promise waitTimeoutMSecs: 0) description: 'promise didn''t resolve'.
	self assert: data asByteArray equals: stream promise value data.
	self assert: header equals: stream promise value header.
	self assert: H2NullReceiver equals: stream receiver class