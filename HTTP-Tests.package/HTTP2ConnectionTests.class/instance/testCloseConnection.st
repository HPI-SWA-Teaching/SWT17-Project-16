testing
testCloseConnection
	|mockStream connection |
	connection := HTTP2Connection new.
	mockStream := self establishMockConnectionFor: connection.
	(Delay forMilliseconds: 10) wait.
	connection closeConnection.
	(Delay forMilliseconds: 10) wait.
	self deny: connection connectionActive