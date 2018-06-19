testing
testIncomingTraffic_HP
	| stream indexTable headerFrame pushFrame header pushHeader headerBlock pushHeaderBlock pushedStream |
	
	stream := H2Stream new: 5 for: H2Request new connection: H2Connection new.
	indexTable := H2HPACKIndexTable new.
	
	pushHeader := H2StreamTests standardPushPromiseHeader.
	pushHeaderBlock := pushHeader encode: indexTable.
	header := H2StreamTests standardResponseHeaderError.
	headerBlock := header encode: indexTable.
	
	pushFrame := H2StreamTests unflaggedPushPromiseFrameFor: pushHeaderBlock.
	pushFrame flags endHeaders: true.
	headerFrame := H2StreamTests lastHeadersFrameFor: headerBlock.
	headerFrame flags endStream: true.
	
	pushFrame receiveOnStream: stream.
	headerFrame receiveOnStream: stream.stream.
	
	[self assert: (stream promise waitTimeoutMSecs: 10) description: 'promise didn''t resolve'.
	pushedStream := stream connection activeStreams at: 6. "this raises an error should the stream not exist"
	self assert: pushHeader equals: pushedStream request header.
	self assert: header equals: stream promise value header.
	self assert: H2NullReceiver equals: stream receiver class] fork