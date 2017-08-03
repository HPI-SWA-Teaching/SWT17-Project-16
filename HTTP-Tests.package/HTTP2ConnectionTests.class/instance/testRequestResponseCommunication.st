as yet unclassified
testRequestResponseCommunication
	| connection mockStream frame request response promise |
	connection := HTTP2Connection new.
	mockStream := self establishMockConnectionFor: connection.
	(Delay forMilliseconds: 10) wait.
	mockStream reset.
	request := self exampleRequest.
	promise := connection openStreamFor: request.
	(Delay forMilliseconds: 10) wait.
	frame := HTTP2HeadersFrame new
		payload: (request header encode: (HTTP2HPACKIndexTable newWith: 4096));
		streamIdentifier: 3;
		flagEndStream: 1;
		flagEndHeaders: 1;
		yourself.
	self assert: mockStream outStream contents equals: frame encode.
	response := self exampleResponse.
	frame := HTTP2HeadersFrame new
		payload: (response header encode:  (HTTP2HPACKIndexTable newWith: 4096));
		streamIdentifier: 3;
		flagEndHeaders: 1;
		yourself.
	mockStream inStream addAll: frame encode.
	frame := HTTP2DataFrame new
		payload: response data;
		streamIdentifier: 3;
		flagEndStream: 1;
		yourself.
	mockStream inStream addAll: frame encode.
	promise then: [:resp |
		self assert: resp header equals: response header.
		self assert: resp data equals: response data asByteArray.
		self assert: (connection activeStreams size) equals: 0]