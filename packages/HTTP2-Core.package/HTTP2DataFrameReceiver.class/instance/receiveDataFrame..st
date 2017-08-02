as yet unclassified
receiveDataFrame: aFrame
	self stream byteStreamIn nextPutAll: aFrame payload.
	aFrame flagEndStream = 1 ifTrue: [self transition]