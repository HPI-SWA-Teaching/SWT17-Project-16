testing
testFlowControlWindow

	stream request: (H2Request new
		header: H2StreamTests standardRequestHeader;
		data: 'some data so the stream is able to send after the header frames';
		yourself).
	self assert: stream flowControlWindow equals: H2Connection standardWindowSize.
	
	stream updateWindowSize: (H2Connection standardWindowSize) negated + 20.
	self assert: stream flowControlWindow equals: 20.
	
	stream nextFrame: 10000.
	self assert: stream flowControlWindow equals: 0.
	self deny: stream isAbleToSend.
	
	(H2WindowUpdateFrame new
		streamIdentifier: 5;
		increment: 200;
		yourself) receiveOnStream: stream.
	self assert: stream flowControlWindow equals: 200.
	self assert: stream isAbleToSend.