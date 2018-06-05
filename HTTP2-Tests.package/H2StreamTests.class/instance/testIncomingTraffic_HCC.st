testing
testIncomingTraffic_HCC
	| stream headerFrame header headerBlock continuationFrame1 continuationFrame2 |
	
	stream := H2Stream new: 5 for: H2Request new connection: H2Connection new.
	
	header := H2StreamTests standardResponseHeader.
	headerBlock := header encode: H2HPACKIndexTable new.
	
	headerFrame := H2FrameTests standardHeadersFrameFor: (headerBlock first: 5).
	headerFrame flags endStream: true.
	continuationFrame1 := H2FrameTests standardContinuationFrameFor: (headerBlock copyFrom: 6 to: 10).
	continuationFrame1 flags endHeaders: false.
	continuationFrame2 := H2FrameTests standardContinuationFrameFor: (headerBlock copyFrom: 11 to: headerBlock size).
	
	headerFrame receiveOnStream: stream.
	continuationFrame1 receiveOnStream: stream.
	continuationFrame2 receiveOnStream: stream.
	
	[self assert: (stream promise waitTimeoutMSecs: 0) description: 'promise didn''t resolve'.
	self assert: header equals: stream promise value header.
	self assert: H2NullReceiver equals: stream receiver class] fork