receiving
receiveDataFrame: aFrame
	self stream byteStreamIn nextPutAll: aFrame payload.
	aFrame hasEndStreamFlag ifTrue: [self transition]