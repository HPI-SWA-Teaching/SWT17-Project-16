testing
testALPNProtosEncoding
	| protos ssl |
	protos := Set with: 'HTTP/1.1' with: 'h2'.
	ssl := SqueakSSL new.
	ssl alpnProtos: protos.
	self assert: ssl alpnProtos equals: (ssl alpnProtosEncode: protos).
