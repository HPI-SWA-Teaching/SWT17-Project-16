receiving
receiveHeaderFrame: aFrame
	self stream byteStreamIn nextPutAll: aFrame payload.
	self transition.
	aFrame hasEndStreamFlag ifTrue: [	self stream receiver nextState: H2NullReceiver new].
	aFrame hasEndHeadersFlag ifTrue: [self stream receiver transition]