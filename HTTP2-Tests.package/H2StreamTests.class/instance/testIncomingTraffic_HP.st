testing
testIncomingTraffic_HP
	| stream headerFrame pushPromiseFrame headerH headerP headerBlockH headerBlockP headerIndexTable |
	
	stream := H2Stream new: 5 for: H2Request new connection: H2Connection new.
	
	headerH := H2StreamTests standardResponseHeader.
	headerP := H2StreamTests standardPushPromiseHeader.
	headerIndexTable := H2HPACKIndexTable new.
	headerBlockH := headerH encode: headerIndexTable.
	headerBlockP := headerP encode: headerIndexTable.
	
	headerFrame := H2FrameTests standardHeadersFrameFor: headerBlockH.
	headerFrame flags endHeaders: true.
	pushPromiseFrame := H2FrameTests standardPushPromiseFrameFor: headerBlockP.
	pushPromiseFrame flags endHeaders: true.
	pushPromiseFrame flags endStream: true.
	
	headerFrame receiveOnStream: stream.
	pushPromiseFrame receiveOnStream: stream.
	
	[self assert: (stream promise waitTimeoutMSecs: 0) description: 'promise didn''t resolve'.
	self assert: headerH equals: stream promise value header.
	self assert: H2NullReceiver equals: stream receiver class] fork