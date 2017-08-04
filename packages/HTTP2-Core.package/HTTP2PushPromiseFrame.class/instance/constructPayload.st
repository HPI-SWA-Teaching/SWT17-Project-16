encoding
constructPayload 
	^ (self integer: self promisedID asByteArrayOfSize: 4), self payload