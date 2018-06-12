testing
testIncomingTraffic_H
	| stream headerFrame header headerBlock |
	
	stream := H2Stream new: 5 for: H2Request new connection: H2Connection new.
	
	header := H2StreamTests standardResponseHeaderError.
	headerBlock := header encode: H2HPACKIndexTable new.
	
	headerFrame := H2StreamTests lastHeadersFrameFor: headerBlock.
	headerFrame flags endStream: true.
	
	headerFrame receiveOnStream: stream.
	
	[self assert: (stream promise waitTimeoutMSecs: 0) description: 'promise didn''t resolve'.
	self assert: header equals: stream promise value header.
	self assert: H2NullReceiver equals: stream receiver class] fork