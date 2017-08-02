as yet unclassified
testReceiveGoaway
	|mockStream streamManager frame |
	mockStream := HTTP2MockSocketStream new.
	streamManager := HTTP2Connection new.
	"dont't use connectTo: method because we need to apply MockSocketStream instead of establishing real Connection"
	streamManager socketStream: mockStream.
	streamManager initiateCommunication.
	(Delay forMilliseconds: 100) wait.
	mockStream reset.
	frame := (HTTP2GoawayFrame new)
		lastID: 9;
		errorCode: 0;
		debugData: 'random infos';
		yourself.
	mockStream inStream addAll: frame encode.
	(Delay forMilliseconds: 100) wait.
	self assert: streamManager connectionActive equals: false.
	"Todo: also test, wether we inform the user about the closed Connection"