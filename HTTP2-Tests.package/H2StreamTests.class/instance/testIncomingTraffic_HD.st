testing
testIncomingTraffic_HD
	| stream headerFrame header dataFrame headerBlock data |
	
	stream := H2Stream new: 5 for: H2Request new connection: H2Connection new.
	
	header := H2HeaderTests standardHeader.
	headerBlock := header encode: H2HPACKIndexTable new.
	data := 'some Data' asByteArray.
	
	headerFrame := H2FrameTests standardHeadersFrameFor: headerBlock.
	headerFrame flagEndHeaders: 1.
	dataFrame := self standardDataFrameFor: data.
	
	headerFrame receiveOnStream: stream.
	dataFrame receiveOnStream: stream.
	
	stream promise then: [:response |
		self assert: response data equals: data asByteArray.
		self assert: response header equals: header.
		self assert: stream receiver class equals: H2NullReceiver]