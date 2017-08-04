encoding
constructPayload
	^ (self integer: self lastID asByteArrayOfSize: 4), 
		(self integer: self errorCode asByteArrayOfSize: 4),
		 self debugData asByteArray