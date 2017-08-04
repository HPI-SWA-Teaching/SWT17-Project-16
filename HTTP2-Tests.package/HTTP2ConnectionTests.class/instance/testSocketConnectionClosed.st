testing
testSocketConnectionClosed
	|mockStream connection|
	connection := H2Connection new.
	mockStream := self establishMockConnectionFor: connection.
	(Delay forMilliseconds: 10) wait.
	mockStream close.
	(Delay forMilliseconds: 10) wait.
	self deny: connection connectionActive