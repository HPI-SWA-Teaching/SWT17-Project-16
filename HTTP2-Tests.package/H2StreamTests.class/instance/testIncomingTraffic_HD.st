testing
testIncomingTraffic_HD
	| stream headerFrame header dataFrame headerBlock data |
	
	stream := H2Stream new: 5 for: H2Request new connection: H2Connection new.
	
	header := H2StreamTests standardResponseHeaderSuccess.
	headerBlock := header encode: H2HPACKIndexTable new.
	data := 'some Data' asByteArray.
	
	headerFrame := H2StreamTests lastHeadersFrameFor: headerBlock.
	dataFrame := H2StreamTests unflaggedDataFrameFor: data.
	dataFrame flags endStream: true.
	
	headerFrame receiveOnStream: stream.
	dataFrame receiveOnStream: stream.
	
	self assert: (stream promise waitTimeoutMSecs: 0) description: 'promise didn''t resolve'.
	self assert: data asByteArray equals: stream promise value data.
	self assert: header equals: stream promise value header.
	self assert: H2NullReceiver equals: stream receiver class