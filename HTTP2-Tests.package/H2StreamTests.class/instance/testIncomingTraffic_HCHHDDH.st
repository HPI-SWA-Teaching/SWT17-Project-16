testing
testIncomingTraffic_HCHHDDH
	| stream serverIndexTable headerI1 headerI2 headerR headerT headerBlockI1 headerBlockI2 headerBlockR headerBlockT data headerFrameI1_1 headerFrameI1_2 headerFrameI2 headerFrameR dataFrame1 dataFrame2 headerFrameT |
	
	stream := H2Stream new: 5 for: H2Request new connection: H2Connection new.
	serverIndexTable := H2HPACKIndexTable new.
	
	headerI1 := H2StreamTests standardResponseHeaderInformational.
	headerI2 := H2StreamTests standardResponseHeaderInformational.
	headerR := H2StreamTests standardResponseHeaderSuccess
					add: 'trailer'->'foo';
					yourself.
	headerT := H2StreamTests standardResponseHeaderTrailing.
	headerBlockI1 := headerI1 encode: serverIndexTable.
	headerBlockI2 := headerI2 encode: serverIndexTable.
	headerBlockR := headerR encode: serverIndexTable.
	headerBlockT := headerT encode: serverIndexTable.
	data := 'some Data' asByteArray.
	
	headerFrameI1_1 := H2StreamTests unflaggedHeadersFrameFor: (headerBlockI1 first: 5).
	headerFrameI1_2 := H2StreamTests lastHeadersFrameFor: (headerBlockI1 copyFrom: 6 to: headerBlockI1 size).
	headerFrameI2 := H2StreamTests lastHeadersFrameFor: headerBlockI2.
	headerFrameR := H2StreamTests lastHeadersFrameFor: headerBlockR.
	dataFrame1 := H2StreamTests unflaggedDataFrameFor: (data first: 5).
	dataFrame2 := H2StreamTests unflaggedDataFrameFor: (data copyFrom: 6 to: data size).
	headerFrameT := H2StreamTests lastHeadersFrameFor: headerBlockT.
	headerFrameT flags endStream: true.
	
	headerFrameI1_1 receiveOnStream: stream.
	headerFrameI1_2 receiveOnStream: stream.
	headerFrameI2 receiveOnStream: stream.
	headerFrameR receiveOnStream: stream.
	dataFrame1 receiveOnStream: stream.
	dataFrame2 receiveOnStream: stream.
	headerFrameT receiveOnStream: stream.
	
	headerR dictionary addAll: headerT dictionary.
	[self assert: (stream promise waitTimeoutMSecs: 0) description: 'promise didn''t resolve'.
	self assert: headerR equals: stream promise value header.
	self assert: data equals: stream promise value data.
	self assert: H2NullReceiver equals: stream receiver class] fork