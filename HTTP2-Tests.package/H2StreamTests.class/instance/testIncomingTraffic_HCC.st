testing
testIncomingTraffic_HCC
	| header |
	
	header := H2StreamTests standardResponseHeaderError.
	
	self receiveClosingHeader: header inParts: 3.
	
	self assert: (stream promise waitTimeoutMSecs: 0) description: 'promise didn''t resolve'.
	self assert: header equals: stream promise value header.
	self assert: H2NullReceiver equals: stream receiver class