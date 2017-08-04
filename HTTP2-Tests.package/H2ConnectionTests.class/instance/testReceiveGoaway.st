testing
testReceiveGoaway
	|mockStream connection frame |
	connection := H2Connection new.
	mockStream := self establishMockConnectionFor: connection.
	frame := (H2GoawayFrame new)
		lastID: 9;
		errorCode: 0;
		debugData: 'random information';
		yourself.
	mockStream inStream addAll: frame encode.
	(Delay forMilliseconds: 10) wait.
	self deny: connection connectionActive