testing
testRequestResponseCommunication
	| connection mockStream frame request response promise |
	connection := H2Connection new.
	mockStream := self establishMockConnectionFor: connection.
	(Delay forMilliseconds: 10) wait.
	mockStream reset.
	request := self exampleRequest.
	promise := connection openStreamFor: request.
	(Delay forMilliseconds: 10) wait.
	frame := H2HeadersFrame new
		payload: (request header encode: H2HPACKIndexTable new);
		streamIdentifier: 3;
		flagEndStream: 1;
		flagEndHeaders: 1;
		yourself.
	self assert: mockStream outStream contents equals: frame encode.
	response := self exampleResponse.
	frame := H2HeadersFrame new
		payload: (response header encode: H2HPACKIndexTable new);
		streamIdentifier: 3;
		flagEndHeaders: 1;
		yourself.
	mockStream inStream addAll: frame encode.
	frame := H2DataFrame new
		payload: response data;
		streamIdentifier: 3;
		flagEndStream: 1;
		yourself.
	mockStream inStream addAll: frame encode.
	promise then: [:resp |
		self assert: resp header equals: response header.
		self assert: resp data equals: response data asByteArray.
		self assert: connection activeStreams isEmpty]