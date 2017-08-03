as yet unclassified
testReceiveGoaway
	|mockStream connection frame |
	connection := HTTP2Connection new.
	mockStream := self establishMockConnectionFor: connection.
	frame := (HTTP2GoawayFrame new)
		lastID: 9;
		errorCode: 0;
		debugData: 'random infos';
		yourself.
	mockStream inStream addAll: frame encode.
	(Delay forMilliseconds: 10) wait.
	self assert: connection connectionActive equals: false