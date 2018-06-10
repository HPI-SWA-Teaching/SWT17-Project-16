receiving
receive: aFrame

	self stream byteStreamIn nextPutAll: aFrame payload.
	aFrame flags endHeaders ifTrue: [self stream headerAdded]
	