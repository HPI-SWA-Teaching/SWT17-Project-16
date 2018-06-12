receiving
process: aFrame
	
	self stream byteStreamIn nextPutAll: aFrame payload.
	aFrame flags endHeaders ifTrue: [self stream headerCompleted]