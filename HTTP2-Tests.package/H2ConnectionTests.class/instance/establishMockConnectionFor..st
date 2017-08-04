initialization
establishMockConnectionFor: aConnection
	| mockStream |
	"don't use HTTP2Connection>>connectTo: method because we need to apply MockSocketStream instead of establishing real Connection"
	mockStream := H2MockSocketStream new.
	aConnection socketStream: mockStream.
	aConnection initiateCommunication.
	^ mockStream