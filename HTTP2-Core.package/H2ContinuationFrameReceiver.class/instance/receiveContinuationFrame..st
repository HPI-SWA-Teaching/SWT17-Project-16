receiving
receiveContinuationFrame: aFrame
	self stream byteStreamIn nextPutAll: aFrame payload.
	aFrame hasEndHeadersFlag ifTrue: [self transition]