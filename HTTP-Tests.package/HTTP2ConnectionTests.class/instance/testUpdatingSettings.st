as yet unclassified
testUpdatingSettings
	| frame mockStream connection |
	connection := HTTP2Connection new.
	mockStream := self establishMockConnectionFor: connection.
	mockStream reset.
	frame := HTTP2SettingsFrame new
			add: 'MaxConcurrentStreams'->110;
			add: 'HeaderTableSize'->2048;
			add: 'MaxFrameSize'->(2 raisedTo: 17);
			add: 'MaxHeaderListSize'->2000;
			yourself.
	mockStream inStream addAll: frame encode.
	
	(Delay forMilliseconds: 10) wait.
	frame := HTTP2SettingsFrame new
			flagAck: 1;
			yourself.
	self assert: mockStream outStream contents equals: frame encode.
	self assert: connection maxConcurrentStreams equals: 110.
	self assert: connection headerTableOut maxDynamicSize equals: 2048.
	self assert: connection headerTableOut dynamicTable size <= 2048