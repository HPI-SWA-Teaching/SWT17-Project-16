testing
testIncomingTraffic_HCPCDD
	| header pushHeader data pushedStream |
	
	header := H2StreamTests standardResponseHeaderSuccess.
	pushHeader := H2StreamTests standardPushPromiseHeader.
	data := 'response' asByteArray.
	
	self receiveHeader: header inParts: 2.
	self receivePushPromise: pushHeader inParts: 2.
	self receiveClosingData: data inParts: 2.
	
	self assert: (stream promise waitTimeoutMSecs: 10) description: 'promise didn''t resolve'.
	pushedStream := stream connection activeStreams at: 6. "this raises an error should the stream not exist"
	self assert: pushHeader equals: pushedStream request header.
	self assert: H2HeadersFrameReceiver equals: pushedStream receiver class.
	self assert: header equals: stream promise value header.
	self assert: data equals: stream promise value data.
	self assert: H2NullReceiver equals: stream receiver class