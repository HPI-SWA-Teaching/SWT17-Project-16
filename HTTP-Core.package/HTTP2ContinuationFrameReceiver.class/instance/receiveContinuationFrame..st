as yet unclassified
receiveContinuationFrame: aFrame
	self stream byteStreamIn nextPutAll: aFrame payload.
	aFrame flagEndHeaders = 1 ifTrue: [self transition]