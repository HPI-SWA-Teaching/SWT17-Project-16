encoding
encodeWithPayload: aPayload
	^ (self integer: aPayload size asByteArrayOfSize: 3),
	(ByteArray with: self type),
	(ByteArray with: self flags),
	(self integer: self streamIdentifier asByteArrayOfSize: 4),
	(aPayload)