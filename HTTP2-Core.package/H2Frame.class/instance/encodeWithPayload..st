encoding
encodeWithPayload: aPayload
	^ (aPayload size asByteArrayOfSize: 3),
	(ByteArray with: self type),
	self flags asByteArray,
	(self streamIdentifier asByteArrayOfSize: 4),
	(aPayload)