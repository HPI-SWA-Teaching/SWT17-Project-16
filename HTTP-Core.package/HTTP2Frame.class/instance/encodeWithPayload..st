encoding
encodeWithPayload: aPayload
	^ (self integer: aPayload size asByteArrayOfSize: 3),
	(self integer: self type asByteArrayOfSize: 1),
	(self integer: self flags asByteArrayOfSize: 1),
	(self integer: self streamIdentifier asByteArrayOfSize: 4),
	(aPayload)