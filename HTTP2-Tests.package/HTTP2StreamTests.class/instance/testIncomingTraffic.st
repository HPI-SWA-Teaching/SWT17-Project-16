testing
testIncomingTraffic
	| stream headerFrame header dataFrame headerBlock continuationFrame data |
	stream := HTTP2Stream new: 5 for: HTTP2Request new connection: HTTP2Connection new.
	header := HTTP2HeaderTests standardHeader.
	headerBlock := header encode: HTTP2HPACKIndexTable new.
	headerFrame := HTTP2FrameTests standardHeadersFrameFor: (headerBlock first: 10). 
	continuationFrame := HTTP2FrameTests standardContinuationFrameFor: (headerBlock copyFrom: 11 to: headerBlock size).
	data := 'some Data'.
	dataFrame := self standardDataFrameFor: data.
	headerFrame receiveOnStream: stream.
	continuationFrame receiveOnStream: stream.
	dataFrame receiveOnStream: stream.
	stream promise then: [:response |
	self assert: response data equals: data asByteArray.
	self assert: response header equals: header.
	self assert: stream receiver class equals: HTTP2NullReceiver]