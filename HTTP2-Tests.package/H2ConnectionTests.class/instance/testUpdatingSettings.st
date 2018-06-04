testing
testUpdatingSettings
	| frame mockStream connection |
	connection := H2Connection new.
	mockStream := self establishMockConnectionFor: connection.
	mockStream reset.
	frame := H2SettingsFrame new
			add: 'MaxConcurrentStreams'->110;
			add: 'HeaderTableSize'->2048;
			add: 'MaxFrameSize'->(2 raisedTo: 17);
			add: 'MaxHeaderListSize'->2000;
			yourself.
	mockStream inStream addAll: frame encode.
	
	(Delay forMilliseconds: 10) wait.
	frame := H2SettingsFrame new.
	frame flags ack: true.
	
	self assert: mockStream outStream contents equals: frame encode.
	self assert: connection maxConcurrentStreams equals: 110.
	self assert: connection headerTableOut maxDynamicSize equals: 2048.
	self assert: connection headerTableOut dynamicTable size <= 2048