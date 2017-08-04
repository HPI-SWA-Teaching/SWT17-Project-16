testing
testSocketConnectionClosed
	|mockStream connection|
	connection := HTTP2Connection new.
	mockStream := self establishMockConnectionFor: connection.
	(Delay forMilliseconds: 10) wait.
	mockStream close.
	(Delay forMilliseconds: 10) wait.
	self assert: connection connectionActive equals: false