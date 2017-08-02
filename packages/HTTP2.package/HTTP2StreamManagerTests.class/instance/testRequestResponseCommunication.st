as yet unclassified
testRequestResponseCommunication
	| streamManager mockStream outframe inframe request inHeader promise |
	mockStream := HTTP2MockSocketStream new.
	streamManager := HTTP2Connection new.
	"dont't use connectTo: method because we need to apply MockSocketStream instead of establishing real Connection"
	streamManager socketStream: mockStream.
	streamManager initiateCommunication.
	(Delay forMilliseconds: 10) wait.
	mockStream reset.
	request := HTTP2Request new.
	request header: (HTTP2Header new).
	request header
		add: ':method'-> 'GET';
		add: ':path' -> '/aPath/example/';
		add: ':scheme' -> 'http';
		add: ':authority' -> 'www.example.com'.
	promise := streamManager openStreamFor: request.
	(Delay forMilliseconds: 10) wait.
	outframe := HTTP2HeadersFrame new
		payload: ((HTTP2Header new
				add: ':method'-> 'GET';
				add: ':path' -> '/aPath/example/';
				add: ':scheme' -> 'http';
				add: ':authority' -> 'www.example.com';
				yourself) encode: (HTTP2HPACKIndexTable newWith: 4096));
		streamIdentifier: 3;
		flagEndStream: 1;
		flagEndHeaders: 1;
		yourself.
	self assert: mockStream outStream contents equals: outframe encode.
	inHeader := (HTTP2Header new)
				add: ':status'-> '200';
				add: 'content-length' -> '9';
				add: 'content-type' -> 'text/html';
				add: 'accept-ranges' -> 'bytes';
				yourself.
	inframe := HTTP2HeadersFrame new
		payload: (inHeader encode:  (HTTP2HPACKIndexTable newWith: 4096));
		streamIdentifier: 3;
		flagEndHeaders: 1;
		yourself.
	mockStream inStream addAll: inframe encode.
	inframe := HTTP2DataFrame new
		payload: 'some data';
		streamIdentifier: 3;
		flagEndStream: 1;
		yourself.
	mockStream inStream addAll: inframe encode.
	promise then: [:response |
	self assert: response header equals: inHeader.
	self assert: response data equals: 'some data' asByteArray.
	self assert: (streamManager activeStreams size) equals: 0]