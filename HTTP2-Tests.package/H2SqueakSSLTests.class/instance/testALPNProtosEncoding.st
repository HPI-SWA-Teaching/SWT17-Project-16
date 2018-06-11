testing
testALPNProtosEncoding
	| ssl |
	ssl := SqueakSSL new.
	ssl alpnProtos: self alpnTestProtocolSet.
	self assert: ssl alpnProtos equals: (ssl alpnProtosEncode: self alpnTestProtocolSet).
