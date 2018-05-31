testing
testIncomingTraffic_HC
	| stream headerFrame header headerBlock continuationFrame |
	
	stream := H2Stream new: 5 for: H2Request new connection: H2Connection new.
	
	header := H2HeaderTests standardHeader.
	headerBlock := header encode: H2HPACKIndexTable new.
	
	headerFrame := H2FrameTests standardHeadersFrameFor: (headerBlock first: 10).
	headerFrame flagEndStream: 1.
	continuationFrame := H2FrameTests standardContinuationFrameFor: (headerBlock copyFrom: 11 to: headerBlock size).
	
	headerFrame receiveOnStream: stream.
	continuationFrame receiveOnStream: stream.
	
	stream promise then: [:response |
		self assert: response header equals: header.
		self assert: stream receiver class equals: H2NullReceiver]