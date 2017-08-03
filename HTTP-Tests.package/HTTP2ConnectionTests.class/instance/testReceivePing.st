as yet unclassified
testReceivePing
	|mockStream frame |
	mockStream := self establishMockConnectionFor: HTTP2Connection new.
	mockStream reset.
	frame := HTTP2PingFrame new
		opaqueData: 1234567890;
		yourself.
	mockStream inStream addAll: frame encode.
	frame flagAck: 1.
	(Delay forMilliseconds: 10) wait.
	self assert: mockStream outStream contents equals: frame encode