testing
testIncomingTraffic_H
	| header |
	
	header := self class standardResponseHeaderError.
	
	self receiveClosingHeader: header inParts: 1.
	
	self assert: (stream promise waitTimeoutMSecs: 0) description: 'promise didn''t resolve'.
	self assert: header equals: stream promise value header.
	self assert: H2NullReceiver equals: stream receiver class