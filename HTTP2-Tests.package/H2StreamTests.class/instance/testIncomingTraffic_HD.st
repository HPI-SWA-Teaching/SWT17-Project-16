testing
testIncomingTraffic_HD
	| stream headerFrame header dataFrame headerBlock data |
	
	stream := H2Stream new: 5 for: H2Request new connection: H2Connection new.
	
	header := H2StreamTests standardResponseHeader.
	headerBlock := header encode: H2HPACKIndexTable new.
	data := 'some Data' asByteArray.
	
	headerFrame := H2FrameTests standardHeadersFrameFor: headerBlock.
	headerFrame flags endHeaders: true.
	dataFrame := self standardDataFrameFor: data.
	
	headerFrame receiveOnStream: stream.
	dataFrame receiveOnStream: stream.
	
	[self assert: (stream promise waitTimeoutMSecs: 0) description: 'promise didn''t resolve'.
	self assert: data asByteArray equals: stream promise value data.
	self assert: header equals: stream promise value header.
	self assert: H2NullReceiver equals: stream receiver class] fork