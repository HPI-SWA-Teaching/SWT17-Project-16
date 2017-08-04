testing
testFlowControlWindow
	| http2stream request frame |
	request := H2Request new.
		request header: (H2Header new
			add: ':method'->'GET';
			add: ':authoritiy'->'www.example.com';
			add: 'bla'->'blubblubblub';
			yourself).
		request data: 'just put some data here'.
	http2stream := H2Stream new: 3 for: request connection: H2Connection new.
	self assert: http2stream flowControlWindow equals: H2Connection standardWindowSize.
	http2stream updateWindowSize: (H2Connection standardWindowSize) negated + 20.
	self assert: http2stream flowControlWindow equals: 20.
	frame := http2stream nextFrame: 10000.
	self deny: http2stream isAbleToSend.
	self assert: http2stream flowControlWindow equals: 0.
	frame := H2WindowUpdateFrame new increment: 200;
		streamIdentifier: 3;
		yourself.
	frame receiveOnStream: http2stream.
	self assert: http2stream isAbleToSend.
	self assert: http2stream flowControlWindow equals: 200.