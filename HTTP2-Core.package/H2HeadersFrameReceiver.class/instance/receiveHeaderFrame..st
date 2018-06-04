receiving
receiveHeaderFrame: aFrame
	self stream byteStreamIn nextPutAll: aFrame payload.
	self transition.
	aFrame flags endStream ifTrue: [self stream receiver nextState: H2NullReceiver].
	aFrame flags endHeaders ifTrue: [self stream receiver transition]