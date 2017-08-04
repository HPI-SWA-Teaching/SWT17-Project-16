testing
testOutgoingTraffic
	| header stream request headerBlock data |
	header := H2HeaderTests standardHeader.
	headerBlock := header encode: H2HPACKIndexTable new.
	data := 'some data' asByteArray.
	request := (H2Request new)
		header: header;
		data: data;
		yourself.
	stream := H2Stream new: 5 for: request connection: H2Connection new.
	self assert: 
			(stream nextFrame: 10) 
		equals: 
			(H2FrameTests standardHeadersFrameFor: (headerBlock first: 10)) encode.
	self assert:
			(stream nextFrame: 100)
		equals:
			(H2FrameTests standardContinuationFrameFor: (headerBlock copyFrom: 11 to: headerBlock size)) encode.
	self assert:
			(stream nextFrame: 100)
		equals:
			(H2FrameTests standardDataFrameFor: data) encode.
	self assert: stream sender class equals: H2NullSender