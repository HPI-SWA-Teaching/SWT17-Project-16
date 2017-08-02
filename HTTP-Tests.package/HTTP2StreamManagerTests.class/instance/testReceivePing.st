as yet unclassified
testReceivePing
	|mockStream streamManager frame |
	mockStream := HTTP2MockSocketStream new.
	streamManager := HTTP2Connection new.
	"dont't use connectTo: method because we need to apply MockSocketStream instead of establishing real Connection"
	streamManager socketStream: mockStream.
	streamManager initiateCommunication.
	(Delay forMilliseconds: 100) wait.
	mockStream reset.
	frame := HTTP2PingFrame new
		opaqueData: 1234567890;
		yourself.
	mockStream inStream addAll: frame encode.
	frame flagAck: 1.
	(Delay forMilliseconds: 100) wait.
	self assert: mockStream outStream contents equals: frame encode.
	"Todo: also test, wether we inform the user about the closed Connection"