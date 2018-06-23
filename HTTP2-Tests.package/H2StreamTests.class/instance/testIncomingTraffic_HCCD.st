testing
testIncomingTraffic_HCCD
	| stream headerFrame header headerBlock continuationFrame1 continuationFrame2 data dataFrame |
	
	stream := H2Stream new: 5 for: H2Request new connection: H2Connection new.
	
	header := H2StreamTests standardResponseHeaderSuccess.
	headerBlock := header encode: H2HPACKIndexTable new.
	data := 'some Data' asByteArray.
	
	headerFrame := H2StreamTests unflaggedHeadersFrameFor: (headerBlock first: 5).
	continuationFrame1 := H2StreamTests unflaggedContinuationFrameFor: (headerBlock copyFrom: 6 to: 10).
	continuationFrame2 := H2StreamTests lastContinuationFrameFor: (headerBlock copyFrom: 11 to: headerBlock size).
	dataFrame := H2StreamTests unflaggedDataFrameFor: data.
	dataFrame flags endStream: true.
	
	headerFrame receiveOnStream: stream.
	continuationFrame1 receiveOnStream: stream.
	continuationFrame2 receiveOnStream: stream.
	dataFrame receiveOnStream: stream.
	
	self assert: (stream promise waitTimeoutMSecs: 0) description: 'promise didn''t resolve'.
	self assert: data asByteArray equals: stream promise value data.
	self assert: header equals: stream promise value header.
	self assert: H2NullReceiver equals: stream receiver class