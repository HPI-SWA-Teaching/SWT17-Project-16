receiving
receiveDataFrame: aFrame
	self stream byteStreamIn nextPutAll: aFrame payload.
	aFrame flags endStream ifTrue: [self transition]