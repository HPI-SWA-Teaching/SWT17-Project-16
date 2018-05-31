testing
testIncomingTraffic_HCCD
	| stream headerFrame header headerBlock continuationFrame1 continuationFrame2 data dataFrame |
	
	stream := H2Stream new: 5 for: H2Request new connection: H2Connection new.
	
	header := H2HeaderTests standardHeader.
	headerBlock := header encode: H2HPACKIndexTable new.
	data := 'some Data' asByteArray.
	
	headerFrame := H2FrameTests standardHeadersFrameFor: (headerBlock first: 5).
	continuationFrame1 := H2FrameTests standardContinuationFrameFor: (headerBlock copyFrom: 6 to: 10).
	continuationFrame1 flagEndHeaders: 0.
	continuationFrame2 := H2FrameTests standardContinuationFrameFor: (headerBlock copyFrom: 11 to: headerBlock size).
	dataFrame := self standardDataFrameFor: data.
	
	headerFrame receiveOnStream: stream.
	continuationFrame1 receiveOnStream: stream.
	continuationFrame2 receiveOnStream: stream.
	dataFrame receiveOnStream: stream.
	
	stream promise then: [:response |
		self assert: response data equals: data asByteArray.
		self assert: response header equals: header.
		self assert: stream receiver class equals: H2NullReceiver]