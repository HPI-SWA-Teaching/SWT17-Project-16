testing
testOutgoingTraffic
	| header stream request headerBlock data |
	header := HTTP2HeaderTests standardHeader.
	headerBlock := header encode: HTTP2HPACKIndexTable new.
	data := 'some data' asByteArray.
	request := (HTTP2Request new)
		header: header;
		data: data;
		yourself.
	stream := HTTP2Stream new: 5 for: request connection: HTTP2Connection new.
	self assert: 
			(stream nextFrame: 10) 
		equals: 
			(HTTP2FrameTests standardHeadersFrameFor: (headerBlock first: 10)) encode.
	self assert:
			(stream nextFrame: 100)
		equals:
			(HTTP2FrameTests standardContinuationFrameFor: (headerBlock copyFrom: 11 to: headerBlock size)) encode.
	self assert:
			(stream nextFrame: 100)
		equals:
			(HTTP2FrameTests standardDataFrameFor: data) encode.
	self assert: stream sender class equals: HTTP2NullFrameSender