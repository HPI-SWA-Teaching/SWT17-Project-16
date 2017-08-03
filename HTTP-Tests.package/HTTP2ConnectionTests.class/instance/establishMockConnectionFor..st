as yet unclassified
establishMockConnectionFor: aConnection
| mockStream |
	"dont't use HTTP2Connection>>connectTo: method because we need to apply MockSocketStream instead of establishing real Connection"
	mockStream := HTTP2MockSocketStream new.
	aConnection socketStream: mockStream.
	aConnection initiateCommunication.
	^ mockStream