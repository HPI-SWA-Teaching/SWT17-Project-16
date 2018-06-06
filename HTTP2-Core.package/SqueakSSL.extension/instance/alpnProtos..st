*HTTP2-Core
alpnProtos: aProtocolSet
	^ self primitiveSSL: handle setStringProperty: 3 toValue: (self alpnProtosEncode: aProtocolSet).