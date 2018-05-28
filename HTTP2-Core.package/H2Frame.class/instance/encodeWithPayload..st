encoding
encodeWithPayload: aPayload
	^ (aPayload size asByteArrayOfSize: 3),
	(ByteArray with: self type),
	(ByteArray with: self flags),
	(self streamIdentifier asByteArrayOfSize: 4),
	(aPayload)