encoding
constructPayload
	^ (self lastID asByteArrayOfSize: 4), 
	(self errorCode asByteArrayOfSize: 4),
	(self debugData asByteArray)