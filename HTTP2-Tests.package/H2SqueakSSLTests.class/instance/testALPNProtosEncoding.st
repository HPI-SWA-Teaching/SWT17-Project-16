testing
testALPNProtosEncoding
	| ssl |
	ssl := SqueakSSL new.
	ssl isAlpnSupported
		ifFalse: [self error: 'SqueakSSL plugin version not supported'].
	ssl alpnProtos: self alpnTestProtocolSet.
	self assert: ssl alpnProtos equals: (ssl alpnProtosEncode: self alpnTestProtocolSet).
