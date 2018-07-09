testing
testIncomingTraffic_HCHHDDH
	| headerI1 headerI2 header headerT data |
	
	headerI1 := H2StreamTests standardResponseHeaderInformational.
	headerI2 := H2StreamTests standardResponseHeaderInformational.
	header := H2StreamTests standardResponseHeaderSuccess.
	headerT := H2StreamTests standardResponseHeaderTrailing.
	data := 'some Data' asByteArray.
	
	self receiveHeader: headerI1 inParts: 2.
	self receiveHeader: headerI2 inParts: 1.
	self receiveHeader: header inParts: 1.
	self receiveData: data inParts: 2.
	self receiveClosingHeader: headerT inParts: 1.
	
	header dictionary addAll: headerT dictionary.
	
	self assert: (stream promise waitTimeoutMSecs: 0) description: 'promise didn''t resolve'.
	self assert: data asByteArray equals: stream promise value data.
	self assert: header equals: stream promise value header.
	self assert: H2NullReceiver equals: stream receiver class