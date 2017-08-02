as yet unclassified
testOutgoingTraffic
	| header stream request headerBlock data |
	header := (HTTP2Header new)
		add: ':method'->'GET';
		add: ':scheme'->'http';
		add: ':path' ->'/';
		add: 'authority'->'www.example.com';
		yourself.
	headerBlock := header encode: (HTTP2HPACKIndexTable newWith: 1000).
	data := 'some data' asByteArray.
	request := (HTTP2Request new)
		header: header;
		data: data;
		yourself.
	stream := HTTP2Stream new: 5 for: request streamManager: HTTP2Connection new.
	self assert:
			(stream nextFrame: 10)
		equals: 
			((HTTP2HeadersFrame new)
				payload: (headerBlock first: 10);
				streamIdentifier: 5;
				yourself) encode.
	self assert:
			(stream nextFrame: 100)
		equals:
			((HTTP2ContinuationFrame new)
				payload: (headerBlock copyFrom: 11 to: headerBlock size);
				streamIdentifier: 5;
				flagEndHeaders: 1;
				yourself) encode.
	self assert:
			(stream nextFrame: 100)
		equals:
			((HTTP2DataFrame new)
				payload: data;
				streamIdentifier: 5;
				flagEndStream: 1;
				yourself) encode.
	self assert: stream sender class equals: HTTP2NullFrameSender