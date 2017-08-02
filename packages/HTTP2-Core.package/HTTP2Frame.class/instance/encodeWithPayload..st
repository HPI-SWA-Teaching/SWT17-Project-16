encoding
encodeWithPayload: aPayload
	^ (aPayload size asByteArrayOfSize: 3),
	(self type asByteArrayOfSize: 1),
	(self flags asByteArrayOfSize: 1),
	(self streamIdentifier asByteArrayOfSize: 4),
	(aPayload)