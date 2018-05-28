encoding
constructPayload 
	^ (self promisedID asByteArrayOfSize: 4),
	(self payload)