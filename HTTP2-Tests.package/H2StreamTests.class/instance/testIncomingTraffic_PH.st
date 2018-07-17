testing
testIncomingTraffic_PH
	| header pushHeader pushedStream |
	
	pushHeader := H2StreamTests standardPushPromiseHeader.
	header := H2StreamTests standardResponseHeaderError.
	
	self receivePushPromise: pushHeader inParts: 1.
	self receiveClosingHeader: header inParts: 1.
	
	self assert: (stream promise waitTimeoutMSecs: 10) description: 'promise didn''t resolve'.
	self shouldnt: [ pushedStream := stream connection activeStreams at: 6. ] raise: Exception.
	self assert: pushHeader equals: pushedStream request header.
	self assert: H2HeadersFrameReceiver equals: pushedStream receiver class.
	self assert: header equals: stream promise value header.
	self assert: H2NullReceiver equals: stream receiver class