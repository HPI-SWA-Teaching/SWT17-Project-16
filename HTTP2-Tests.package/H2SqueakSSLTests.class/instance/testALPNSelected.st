testing
testALPNSelected
	| protos stream ssl |
	protos := Set with: 'HTTP/1.1' with: 'h2'.
	stream := SocketStream openConnectionToHostNamed: 'archlinux.org' port: 443.
	ssl := SqueakSSL on: stream socket.
	ssl
		alpnProtos: protos;
		connect.
	self assert: (protos includes: ssl alpnSelected).
