testing
testIncomingTraffic_H
	| stream headerFrame header headerBlock |
	
	stream := H2Stream new: 5 for: H2Request new connection: H2Connection new.
	
	header := H2HeaderTests standardHeader.
	headerBlock := header encode: H2HPACKIndexTable new.
	
	headerFrame := H2FrameTests standardHeadersFrameFor: headerBlock.
	headerFrame flags endHeaders: true.
	headerFrame flags endStream: true.
	
	headerFrame receiveOnStream: stream.
	
	stream promise then: [:response |
		self assert: response header equals: header.
		self assert: stream receiver class equals: H2NullReceiver]