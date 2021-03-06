testing
testALPNSelected
	| stream ssl |
	self ensureInternetConnectionTo: 'http://', self alpnTestUrl.
	stream := SocketStream openConnectionToHostNamed: (self alpnTestUrl) port: 443.
	ssl := SqueakSSL on: stream socket.
	ssl isAlpnSupported
		ifFalse: [self error: 'SqueakSSL plugin version not supported'].
	ssl
		alpnProtos: self alpnTestProtocolSet;
		connect.
	self assert: (self alpnTestProtocolSet includes: ssl alpnSelected).
