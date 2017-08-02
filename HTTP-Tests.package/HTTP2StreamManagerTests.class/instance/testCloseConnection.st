as yet unclassified
testCloseConnection
	|mockStream streamManager|
	mockStream := HTTP2MockSocketStream new.
	streamManager := HTTP2Connection new.
	"dont't use connectTo: method because we need to apply MockSocketStream instead of establishing real Connection"
	streamManager socketStream: mockStream.
	streamManager initiateCommunication.
	(Delay forMilliseconds: 100) wait.
	streamManager closeConnection.
	(Delay forMilliseconds: 100) wait.
	self assert: streamManager connectionActive equals: false.
	"Todo: also test, wether we inform the user about the closed Connection"