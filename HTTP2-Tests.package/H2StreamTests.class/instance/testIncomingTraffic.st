testing
testIncomingTraffic
	| stream headerFrame header dataFrame headerBlock continuationFrame data |
	stream := H2Stream new: 5 for: H2Request new connection: H2Connection new.
	header := H2HeaderTests standardHeader.
	headerBlock := header encode: H2HPACKIndexTable new.
	headerFrame := H2FrameTests standardHeadersFrameFor: (headerBlock first: 10). 
	continuationFrame := H2FrameTests standardContinuationFrameFor: (headerBlock copyFrom: 11 to: headerBlock size).
	data := 'some Data' asByteArray.
	dataFrame := self standardDataFrameFor: data.
	headerFrame receiveOnStream: stream.
	continuationFrame receiveOnStream: stream.
	dataFrame receiveOnStream: stream.
	stream promise then: [:response |
	self assert: response data equals: data asByteArray.
	self assert: response header equals: header.
	self assert: stream receiver class equals: H2NullReceiver]