testing
testReceivePing
	|mockStream frame |
	mockStream := self establishMockConnectionFor: H2Connection new.
	mockStream reset.
	frame := H2PingFrame new
		opaqueData: 1234567890;
		yourself.
	mockStream inStream addAll: frame encode.
	frame setAckFlag: true.
	(Delay forMilliseconds: 10) wait.
	self assert: mockStream outStream contents equals: frame encode