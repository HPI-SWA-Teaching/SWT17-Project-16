testing
testFlowControlWindow
	| http2stream request frame |
	request := HTTP2Request new.
		request header: (HTTP2Header new
			add: ':method'->'GET';
			add: ':authoritiy'->'www.example.com';
			add: 'bla'->'blubblubblub';
			yourself).
		request data: 'just put some data here'.
	http2stream := HTTP2Stream new: 3 for: request connection: HTTP2Connection new.
	self assert: http2stream flowControlWindow equals: HTTP2Connection standardWindowSize.
	http2stream updateWindowSize: (HTTP2Connection standardWindowSize) negated + 20.
	self assert: http2stream flowControlWindow equals: 20.
	frame := http2stream nextFrame: 10000.
	self deny: http2stream isAbleToSend.
	self assert: http2stream flowControlWindow equals: 0.
	frame := HTTP2WindowUpdateFrame new increment: 200;
		streamIdentifier: 3;
		yourself.
	frame receiveOnStream: http2stream.
	self assert: http2stream isAbleToSend.
	self assert: http2stream flowControlWindow equals: 200.